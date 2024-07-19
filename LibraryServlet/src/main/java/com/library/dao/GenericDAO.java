package com.library.dao;

import com.library.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;

public abstract class GenericDAO<T, ID extends Serializable> {

    private Class<T> entityClass;
    private SessionFactory sessionFactory;

    public GenericDAO(Class<T> entityClass) {
        this.entityClass = entityClass;
        this.sessionFactory = HibernateUtil.getSessionFactory();
    }

    protected Session getSession() {
        return sessionFactory.openSession();
    }

    public void save(T entity) {
        Session session = getSession();
        Transaction transaction = session.beginTransaction();
        session.save(entity);
        transaction.commit();
        session.close();
    }

    public T findById(ID id) {
        Session session = getSession();
        T entity = session.get(entityClass, id);
        session.close();
        return entity;
    }

    public List<T> findAll() {
        try (Session session = getSession()) {
            return session.createQuery("FROM " + entityClass.getName(), entityClass).getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return Collections.emptyList();
        }
    }

    public void update(T entity) {
        Session session = getSession();
        Transaction transaction = session.beginTransaction();
        session.update(entity);
        transaction.commit();
        session.close();
    }

    public void delete(T entity) {
        Session session = getSession();
        Transaction transaction = session.beginTransaction();
        session.delete(entity);
        transaction.commit();
        session.close();
    }

    public void deleteById(ID id) {
        T entity = findById(id);
        if (entity != null) {
            delete(entity);
        }
    }

}