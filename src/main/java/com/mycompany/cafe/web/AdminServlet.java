package com.mycompany.cafe.web;

import com.mycompany.cafe.dao.ProductoDAO;
import com.mycompany.cafe.dao.UsuarioDAO;
import com.mycompany.cafe.model.Producto;
import com.mycompany.cafe.model.Usuario;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {

    private final UsuarioDAO usuarioDAO = new UsuarioDAO();
    private final ProductoDAO productoDAO = new ProductoDAO();

    private boolean noEsAdmin(HttpServletRequest request) {

        HttpSession sesion = request.getSession();
        Usuario usuario = (Usuario) sesion.getAttribute("usuario");

        return usuario == null || !usuario.esAdmin();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (noEsAdmin(request)) {
            response.sendRedirect(request.getContextPath() + "/views/login.jsp");
            return;
        }

        request.setAttribute("usuarios", usuarioDAO.listarTodos());
        request.setAttribute("productos", productoDAO.listarTodos());

        request.getRequestDispatcher("/views/admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (noEsAdmin(request)) {
            response.sendRedirect(request.getContextPath() + "/views/login.jsp");
            return;
        }

        String accion = request.getParameter("accion");

        if ("crearProducto".equals(accion)) {

            String nombre = request.getParameter("nombre");
            String descripcion = request.getParameter("descripcion");
            double precio = Double.parseDouble(request.getParameter("precio"));
            int stock = Integer.parseInt(request.getParameter("stock"));
            String imagen = request.getParameter("imagen");
            String categoria = request.getParameter("categoria");

            productoDAO.crear(new Producto(nombre, descripcion, precio, stock, imagen, categoria));

        } else if ("actualizarStock".equals(accion)) {

            int idProducto = Integer.parseInt(request.getParameter("idProducto"));
            int nuevoStock = Integer.parseInt(request.getParameter("stock"));

            productoDAO.actualizarStock(idProducto, nuevoStock);

        } else if ("eliminarProducto".equals(accion)) {

            int idProducto = Integer.parseInt(request.getParameter("idProducto"));
            productoDAO.eliminar(idProducto);
        }

        response.sendRedirect(request.getContextPath() + "/AdminServlet");
    }
}