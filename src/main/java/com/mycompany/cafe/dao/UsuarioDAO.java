package com.mycompany.cafe.dao;

import com.mycompany.cafe.model.Usuario;
import com.mycompany.cafe.util.HibernateUtil;

import java.util.logging.Level;
import java.util.logging.Logger;

import org.hibernate.Session;
import org.hibernate.Transaction;

public class UsuarioDAO {

    // Registrar usuario con Hibernate
    public boolean registrarUsuario(Usuario usuario) {

        Transaction transaction = null;

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

            transaction = session.beginTransaction();

            session.persist(usuario);

            transaction.commit();

            return true;

        } catch (Exception e) {

            if (transaction != null) {
                transaction.rollback();
            }

            Logger.getLogger(UsuarioDAO.class.getName()).log(
                    Level.SEVERE,
                    "Error al registrar el usuario.",
                    e
            );

            return false;
        }
    }

    // Iniciar sesión con Hibernate
    public Usuario iniciarSesion(String correo, String password) {

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

            String hql = "FROM Usuario WHERE correo = :correo AND password = :password";

            return session.createQuery(hql, Usuario.class)
                    .setParameter("correo", correo)
                    .setParameter("password", password)
                    .uniqueResult();

        } catch (Exception e) {

            Logger.getLogger(UsuarioDAO.class.getName()).log(
                    Level.SEVERE,
                    "Error al iniciar sesión.",
                    e
            );

            return null;
        }
    }
}