package com.mycompany.cafe.util;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {

    private static final SessionFactory sessionFactory;

    static {

        try {

            sessionFactory = new Configuration()
                    .configure("hibernate.cfg.xml")
                    .buildSessionFactory();

        } catch (HibernateException ex) {
 System.out.println("====================================");
    System.out.println("ERROR AL CREAR SESSION FACTORY");
    System.out.println("====================================");

    throw new ExceptionInInitializerError(ex);
        }
        
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public static void shutdown() {
        sessionFactory.close();
    }

}