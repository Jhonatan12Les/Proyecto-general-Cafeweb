package com.mycompany.cafe.web;

import com.mycompany.cafe.dao.UsuarioDAO;
import com.mycompany.cafe.model.Usuario;

import java.io.IOException;
import java.sql.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegistroServlet")
public class RegistroServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Recibir los datos del formulario
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String cedula = request.getParameter("cedula");
        String fecha = request.getParameter("fecha");
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");

        // Crear el objeto Usuario
        Usuario usuario = new Usuario();

        usuario.setNombre(nombre);
        usuario.setApellido(apellido);
        usuario.setCedula(cedula);
        usuario.setFechaNacimiento(Date.valueOf(fecha));
        usuario.setCorreo(correo);
        usuario.setPassword(password);

        // Guardar en la base de datos
        UsuarioDAO dao = new UsuarioDAO();

        boolean registrado = dao.registrarUsuario(usuario);

        if (registrado) {
            response.sendRedirect(request.getContextPath() + "/views/login.jsp");
        } else {
            response.getWriter().println("No fue posible registrar el usuario.");
        }
    }
}