package com.mycompany.cafe.web;

import com.mycompany.cafe.dao.UsuarioDAO;
import com.mycompany.cafe.model.Usuario;
import com.mycompany.cafe.util.MailUtil;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.UUID;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/RecoverServlet")
public class RecoverServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String correo = request.getParameter("correo");

        UsuarioDAO dao = new UsuarioDAO();
        Usuario usuario = dao.buscarPorCorreo(correo);

        HttpSession sesion = request.getSession();

        if (usuario != null) {

            String token = UUID.randomUUID().toString();
            Timestamp expira = new Timestamp(System.currentTimeMillis() + (30 * 60 * 1000)); // 30 minutos

            dao.guardarTokenRecuperacion(usuario.getId(), token, expira);

            String enlace = request.getScheme() + "://" + request.getServerName()
                    + ":" + request.getServerPort() + request.getContextPath()
                    + "/ResetPasswordServlet?token=" + token;

            MailUtil.enviarCorreoRecuperacion(usuario.getCorreo(), enlace);
        }

        // Por seguridad, mostramos el mismo mensaje exista o no el correo
        // (asi nadie puede usar este formulario para adivinar que correos estan registrados)
        sesion.setAttribute("mensajeRecuperacion",
                "Si el correo esta registrado, te enviamos un enlace para restablecer tu contraseña.");

        response.sendRedirect(request.getContextPath() + "/views/recover.jsp");
    }
}