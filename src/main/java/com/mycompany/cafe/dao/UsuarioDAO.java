package com.mycompany.cafe.dao;

import com.mycompany.cafe.model.Usuario;
import com.mycompany.cafe.util.HibernateUtil;

import java.sql.Timestamp;
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

    // Iniciar sesion con Hibernate
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
                    "Error al iniciar sesion.",
                    e
            );

            return null;
        }
    }

    // Buscar usuario por correo (para recuperacion de contraseña)
    public Usuario buscarPorCorreo(String correo) {

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

            String hql = "FROM Usuario WHERE correo = :correo";

            return session.createQuery(hql, Usuario.class)
                    .setParameter("correo", correo)
                    .uniqueResult();

        } catch (Exception e) {

            Logger.getLogger(UsuarioDAO.class.getName()).log(
                    Level.SEVERE,
                    "Error al buscar el usuario por correo.",
                    e
            );

            return null;
        }
    }

    // Guardar el token de recuperacion y su fecha de expiracion
    public boolean guardarTokenRecuperacion(int idUsuario, String token, Timestamp expira) {

        Transaction transaction = null;

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

            transaction = session.beginTransaction();

            Usuario usuario = session.get(Usuario.class, idUsuario);

            if (usuario == null) {
                transaction.rollback();
                return false;
            }

            usuario.setResetToken(token);
            usuario.setResetTokenExpira(expira);

            session.merge(usuario);

            transaction.commit();

            return true;

        } catch (Exception e) {

            if (transaction != null) {
                transaction.rollback();
            }

            Logger.getLogger(UsuarioDAO.class.getName()).log(
                    Level.SEVERE,
                    "Error al guardar el token de recuperacion.",
                    e
            );

            return false;
        }
    }

    // Buscar usuario por token de recuperacion
    public Usuario buscarPorToken(String token) {

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

            String hql = "FROM Usuario WHERE resetToken = :token";

            return session.createQuery(hql, Usuario.class)
                    .setParameter("token", token)
                    .uniqueResult();

        } catch (Exception e) {

            Logger.getLogger(UsuarioDAO.class.getName()).log(
                    Level.SEVERE,
                    "Error al buscar el usuario por token.",
                    e
            );

            return null;
        }
    }

    // Actualizar la contraseña y limpiar el token usado
    public boolean actualizarPassword(int idUsuario, String nuevaPassword) {

        Transaction transaction = null;

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

            transaction = session.beginTransaction();

            Usuario usuario = session.get(Usuario.class, idUsuario);

            if (usuario == null) {
                transaction.rollback();
                return false;
            }

            usuario.setPassword(nuevaPassword);
            usuario.setResetToken(null);
            usuario.setResetTokenExpira(null);

            session.merge(usuario);

            transaction.commit();

            return true;

        } catch (Exception e) {

            if (transaction != null) {
                transaction.rollback();
            }

            Logger.getLogger(UsuarioDAO.class.getName()).log(
                    Level.SEVERE,
                    "Error al actualizar la contraseña.",
                    e
            );

            return false;
        }
    }
}