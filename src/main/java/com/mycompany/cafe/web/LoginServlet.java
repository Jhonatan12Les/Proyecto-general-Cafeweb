package com.mycompany.cafe.web;

import com.mycompany.cafe.dao.UsuarioDAO;
import com.mycompany.cafe.model.Usuario;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Recibir datos del formulario
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");

        // Consultar base de datos
        UsuarioDAO dao = new UsuarioDAO();
        Usuario usuario = dao.iniciarSesion(correo, password);

        if (usuario != null) {

            // Crear la sesión
            HttpSession sesion = request.getSession();
            sesion.setAttribute("usuario", usuario);

            // Redireccionar al inicio
            response.sendRedirect(request.getContextPath() + "/index.jsp");

        } else {

            // Usuario o contraseña incorrectos
            response.getWriter().println("Correo o contraseña incorrectos.");

        }
    }
}