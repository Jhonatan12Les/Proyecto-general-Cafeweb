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

        String correo = request.getParameter("correo");
        String password = request.getParameter("password");

        UsuarioDAO dao = new UsuarioDAO();
        Usuario usuario = dao.iniciarSesion(correo, password);

        HttpSession sesion = request.getSession();

        if (usuario != null) {

            sesion.setAttribute("usuario", usuario);


            String destino = (String) sesion.getAttribute("redirectDespuesLogin");

            if (destino != null) {
                sesion.removeAttribute("redirectDespuesLogin");
                response.sendRedirect(destino);
            } else if (usuario.esAdmin()) {

                response.sendRedirect(request.getContextPath() + "/AdminServlet");
            } else {
 
                response.sendRedirect(request.getContextPath() + "/views/inicio.jsp");
            }

        } else {

            sesion.setAttribute("errorLogin", "Correo o contraseña incorrectos.");
            response.sendRedirect(request.getContextPath() + "/views/login.jsp");
        }
    }
}