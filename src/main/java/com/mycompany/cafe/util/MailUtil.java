package com.mycompany.cafe.util;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;

public class MailUtil {


    private static final String CORREO_REMITENTE = "lesmesjt15@gmail.com";
    private static final String CLAVE_APLICACION = "kgon fkip kgen uzmw";

    public static boolean enviarCorreoRecuperacion(String destinatario, String enlaceRecuperacion) {

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new jakarta.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(CORREO_REMITENTE, CLAVE_APLICACION);
            }
        });

        try {

            Message mensaje = new MimeMessage(session);
            mensaje.setFrom(new InternetAddress(CORREO_REMITENTE, "Café Jhona"));
            mensaje.setRecipients(Message.RecipientType.TO, InternetAddress.parse(destinatario));
            mensaje.setSubject("Recupera tu contraseña - Café Jhona");

            String cuerpo =
                    "<div style='font-family: Arial, sans-serif; color: #3e2723;'>"
                    + "<h2 style='color: #7b4b27;'>Café Jhona</h2>"
                    + "<p>Recibimos una solicitud para restablecer tu contraseña.</p>"
                    + "<p>Haz clic en el siguiente enlace (valido por 30 minutos):</p>"
                    + "<p><a href='" + enlaceRecuperacion + "' "
                    + "style='background-color:#c17a3d; color:#fff; padding:10px 20px; "
                    + "border-radius:8px; text-decoration:none;'>Restablecer contraseña</a></p>"
                    + "<p>Si tu no solicitaste esto, puedes ignorar este correo.</p>"
                    + "</div>";

            mensaje.setContent(cuerpo, "text/html; charset=UTF-8");

            Transport.send(mensaje);

            return true;

        } catch (MessagingException | UnsupportedEncodingException e) {

            Logger.getLogger(MailUtil.class.getName()).log(
                    Level.SEVERE,
                    "Error al enviar el correo de recuperacion.",
                    e
            );

            return false;
        }
    }
}