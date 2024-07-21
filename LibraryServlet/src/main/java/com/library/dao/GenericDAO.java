package com.library.dao;

import com.library.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.Serializable;
import java.util.List;
import java.util.function.Consumer;

public abstract class GenericDAO<T, ID extends Serializable> {

    private Class<T> entityClass;

    public GenericDAO(Class<T> entityClass) {
        this.entityClass = entityClass;
    }

    public void save(T entity) {
        executeInsideTransaction(session -> session.save(entity));
    }

    public T findById(ID id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            T entity = session.get(entityClass, id);
            return entity;
        }
    }

    public List<T> findAll() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM " + entityClass.getName(), entityClass).list();
        }
    }

    public void update(T entity) {
        executeInsideTransaction(session -> session.update(entity));
    }

    public void delete(T entity) {
        executeInsideTransaction(session -> session.delete(entity));
    }

    public void deleteById(ID id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            T entity = session.get(entityClass, id);
            if (entity != null) {
                delete(entity);
            }
        }
    }

    public static void executeInsideTransaction(Consumer<Session> action) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.getTransaction();
        try {
            transaction.begin();
            action.accept(session);
            transaction.commit();
        } catch (Exception e) {
            if (transaction.isActive()) transaction.rollback();
            throw new RuntimeException(e);
        } finally {
            session.close();
        }
    }

}