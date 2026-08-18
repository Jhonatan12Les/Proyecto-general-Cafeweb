package com.mycompany.cafe.dao;

import com.mycompany.cafe.model.Producto;
import com.mycompany.cafe.util.HibernateUtil;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.hibernate.Session;
import org.hibernate.Transaction;

public class ProductoDAO {

    public List<Producto> listarTodos() {

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

            return session.createQuery("FROM Producto ORDER BY categoria, nombre", Producto.class)
                    .list();

        } catch (Exception e) {

            Logger.getLogger(ProductoDAO.class.getName()).log(
                    Level.SEVERE, "Error al listar los productos.", e);

            return List.of();
        }
    }

    public boolean crear(Producto producto) {

        Session session = null;
        Transaction transaction = null;

        try {

            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();

            session.persist(producto);

            transaction.commit();

            return true;

        } catch (Exception e) {

            if (transaction != null) {
                transaction.rollback();
            }

            Logger.getLogger(ProductoDAO.class.getName()).log(
                    Level.SEVERE, "Error al crear el producto.", e);

            return false;

        } finally {

            if (session != null) {
                session.close();
            }
        }
    }

    public boolean actualizarStock(int idProducto, int nuevoStock) {

        Session session = null;
        Transaction transaction = null;

        try {

            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();

            Producto producto = session.get(Producto.class, idProducto);

            if (producto == null) {
                transaction.rollback();
                return false;
            }

            producto.setStock(nuevoStock);
            session.merge(producto);

            transaction.commit();

            return true;

        } catch (Exception e) {

            if (transaction != null) {
                transaction.rollback();
            }

            Logger.getLogger(ProductoDAO.class.getName()).log(
                    Level.SEVERE, "Error al actualizar el stock.", e);

            return false;

        } finally {

            if (session != null) {
                session.close();
            }
        }
    }

    public boolean eliminar(int idProducto) {

        Session session = null;
        Transaction transaction = null;

        try {

            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();

            Producto producto = session.get(Producto.class, idProducto);

            if (producto != null) {
                session.remove(producto);
            }

            transaction.commit();

            return true;

        } catch (Exception e) {

            if (transaction != null) {
                transaction.rollback();
            }

            Logger.getLogger(ProductoDAO.class.getName()).log(
                    Level.SEVERE, "Error al eliminar el producto.", e);

            return false;

        } finally {

            if (session != null) {
                session.close();
            }
        }
    }
}