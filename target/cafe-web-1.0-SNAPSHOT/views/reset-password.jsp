<%
    String token = (String) request.getAttribute("token");
    String errorPassword = (String) request.getAttribute("errorPassword");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nueva contraseña - Café Jhona</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/recover.css">
</head>
<body>

    <a href="${pageContext.request.contextPath}/index.jsp" class="btn-home">
        Café Jhona
    </a>

    <div class="auth-container">

        <div class="auth-card">

            <div class="brand-badge">CJ</div>

            <h1>Crear nueva contraseña</h1>

            <p class="descripcion">
                Escribe tu nueva contraseña. El enlace es de un solo uso.
            </p>

            <% if (errorPassword != null) { %>
                <div class="aviso-error"><%= errorPassword %></div>
            <% } %>

            <form action="${pageContext.request.contextPath}/ResetPasswordServlet" method="post">

                <input type="hidden" name="token" value="<%= token %>">

                <div class="input-group">
                    <label for="password">Nueva contraseña</label>
                    <input
                        type="password"
                        id="password"
                        name="password"
                        placeholder="Mínimo 6 caracteres"
                        minlength="6"
                        required>
                </div>

                <div class="input-group">
                    <label for="confirmarPassword">Confirmar contraseña</label>
                    <input
                        type="password"
                        id="confirmarPassword"
                        name="confirmarPassword"
                        placeholder="Repite la contraseña"
                        minlength="6"
                        required>
                </div>

                <button type="submit" class="btn">
                    Actualizar contraseña
                </button>

            </form>

        </div>

    </div>

</body>
</html>