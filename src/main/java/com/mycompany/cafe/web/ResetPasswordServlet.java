package com.mycompany.cafe.web;

import com.mycompany.cafe.dao.UsuarioDAO;
import com.mycompany.cafe.model.Usuario;

import java.io.IOException;
import java.sql.Timestamp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String token = request.getParameter("token");

        UsuarioDAO dao = new UsuarioDAO();
        Usuario usuario = (token != null) ? dao.buscarPorToken(token) : null;

        HttpSession sesion = request.getSession();

        boolean tokenValido = usuario != null
                && usuario.getResetTokenExpira() != null
                && usuario.getResetTokenExpira().after(new Timestamp(System.currentTimeMillis()));

        if (!tokenValido) {
            sesion.setAttribute("errorToken",
                    "El enlace no es valido o ya expiro. Solicita uno nuevo.");
            response.sendRedirect(request.getContextPath() + "/views/login.jsp");
            return;
        }

        request.setAttribute("token", token);
        request.getRequestDispatcher("/views/reset-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String token = request.getParameter("token");
        String nuevaPassword = request.getParameter("password");
        String confirmarPassword = request.getParameter("confirmarPassword");

        UsuarioDAO dao = new UsuarioDAO();
        Usuario usuario = (token != null) ? dao.buscarPorToken(token) : null;

        HttpSession sesion = request.getSession();

        boolean tokenValido = usuario != null
                && usuario.getResetTokenExpira() != null
                && usuario.getResetTokenExpira().after(new Timestamp(System.currentTimeMillis()));

        if (!tokenValido) {
            sesion.setAttribute("errorToken",
                    "El enlace no es valido o ya expiro. Solicita uno nuevo.");
            response.sendRedirect(request.getContextPath() + "/views/recover.jsp");
            return;
        }

        if (nuevaPassword == null || !nuevaPassword.equals(confirmarPassword)) {
            request.setAttribute("token", token);
            request.setAttribute("errorPassword", "Las contraseñas no coinciden.");
            request.getRequestDispatcher("/views/reset-password.jsp").forward(request, response);
            return;
        }

        dao.actualizarPassword(usuario.getId(), nuevaPassword);

        sesion.setAttribute("mensajeLogin", "Tu contraseña fue actualizada. Ya puedes iniciar sesion.");
        response.sendRedirect(request.getContextPath() + "/views/login.jsp");
    }
}