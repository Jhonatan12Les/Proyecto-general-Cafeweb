<%
    String mensaje = (String) session.getAttribute("mensajeRecuperacion");
    String error = (String) session.getAttribute("errorToken");

    if (mensaje != null) {
        session.removeAttribute("mensajeRecuperacion");
    }

    if (error != null) {
        session.removeAttribute("errorToken");
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recuperar contraseña - Café Jhona</title>

    <link rel="stylesheet" href="../css/base.css">
    <link rel="stylesheet" href="../css/recover.css">
</head>
<body>

    <a href="../index.jsp" class="btn-home">
        Café Jhona
    </a>

    <div class="auth-container">

        <div class="auth-card">

            <div class="brand-badge">CJ</div>

            <h1>Recuperar contraseña</h1>

            <p class="descripcion">
                Ingresa tu correo electrónico vinculado a tu cuenta y te enviaremos un enlace para restablecer tu contraseña.
            </p>

            <% if (mensaje != null) { %>
                <div class="aviso-exito"><%= mensaje %></div>
            <% } %>

            <% if (error != null) { %>
                <div class="aviso-error"><%= error %></div>
            <% } %>

            <form action="${pageContext.request.contextPath}/RecoverServlet" method="post">

                <div class="input-group">
                    <label for="correo">Correo electrónico</label>
                    <input
                        type="email"
                        id="correo"
                        name="correo"
                        placeholder="ejemplo@correo.com"
                        required>
                </div>

                <button type="submit" class="btn">
                    Enviar enlace
                </button>

            </form>

            <div class="extra-links">
                <a href="login.jsp">
                    Volver al inicio de sesión
                </a>
            </div>

        </div>

    </div>

</body>
</html>