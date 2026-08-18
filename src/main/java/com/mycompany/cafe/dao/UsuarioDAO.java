package com.mycompany.cafe.dao;

import com.mycompany.cafe.model.Usuario;
import com.mycompany.cafe.util.HibernateUtil;

import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.hibernate.Session;
import org.hibernate.Transaction;

public class UsuarioDAO {

    public boolean registrarUsuario(Usuario usuario) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.persist(usuario);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, "Error al registrar el usuario.", e);
            return false;
        }
    }

    public Usuario iniciarSesion(String correo, String password) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String hql = "FROM Usuario WHERE correo = :correo AND password = :password";
            return session.createQuery(hql, Usuario.class)
                    .setParameter("correo", correo)
                    .setParameter("password", password)
                    .uniqueResult();
        } catch (Exception e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, "Error al iniciar sesion.", e);
            return null;
        }
    }

    public Usuario buscarPorCorreo(String correo) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String hql = "FROM Usuario WHERE correo = :correo";
            return session.createQuery(hql, Usuario.class)
                    .setParameter("correo", correo)
                    .uniqueResult();
        } catch (Exception e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, "Error al buscar el usuario por correo.", e);
            return null;
        }
    }

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
            if (transaction != null) transaction.rollback();
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, "Error al guardar el token de recuperacion.", e);
            return false;
        }
    }

    public Usuario buscarPorToken(String token) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String hql = "FROM Usuario WHERE resetToken = :token";
            return session.createQuery(hql, Usuario.class)
                    .setParameter("token", token)
                    .uniqueResult();
        } catch (Exception e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, "Error al buscar el usuario por token.", e);
            return null;
        }
    }

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
            if (transaction != null) transaction.rollback();
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, "Error al actualizar la contraseña.", e);
            return false;
        }
    }

    public java.util.List<Usuario> listarTodos() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Usuario ORDER BY nombre", Usuario.class).list();
        } catch (Exception e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, "Error al listar los usuarios.", e);
            return java.util.List.of();
        }
    }
}