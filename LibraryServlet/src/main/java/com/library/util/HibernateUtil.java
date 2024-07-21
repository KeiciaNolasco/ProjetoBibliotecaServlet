package com.library.util;

import lombok.Getter;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.io.*;
import java.util.stream.Collectors;

public class HibernateUtil{

    @Getter
    private static final SessionFactory sessionFactory = buildSessionFactory();

    private static SessionFactory buildSessionFactory() {
        try {
            return new Configuration().configure("/hibernate.cfg.xml").buildSessionFactory();
        } catch (Throwable ex) {
            System.err.println("A criação inicial do SessionFactory falhou." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static void shutdown() {
            getSessionFactory().close();
    }

}