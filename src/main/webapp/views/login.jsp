
<%
    String errorLogin = (String) session.getAttribute("errorLogin");
    String mensajeLoginRequerido = (String) session.getAttribute("mensajeLoginRequerido");

    if (errorLogin != null) {
        session.removeAttribute("errorLogin");
    }

    if (mensajeLoginRequerido != null) {
        session.removeAttribute("mensajeLoginRequerido");
    }
%>

<% if (mensajeLoginRequerido != null) { %>
    <div class="info-message"><%= mensajeLoginRequerido %></div>
<% } %>

<% if (errorLogin != null) { %>
    <div class="error-message"><%= errorLogin %></div>
<% } %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión - Café Jhona</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/styles.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/login.css">
        <link rel="stylesheet"
</head>
<body>

    <a href="${pageContext.request.contextPath}/index.jsp" class="btn-home">
        Café Jhona
    </a>

    <div class="login-container">

        <div class="login-image">
            <img
                src="https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&w=800&q=80"
                alt="Café">
            <div class="overlay"></div>
            <div class="quote">
                <h3>Tu café de siempre</h3>
                <p>Panadería artesanal y café colombiano, listos en minutos.</p>
            </div>
        </div>

        <div class="login-form">

            <div class="brand-badge">CJ</div>

            <h1>Bienvenido de nuevo</h1>
            <h2>Ingresa a tu cuenta para continuar</h2>

            <% if (errorLogin != null) { %>
                <div class="error-message"><%= errorLogin %></div>
            <% } %>

            <form action="${pageContext.request.contextPath}/LoginServlet" method="post">

                <div class="input-group">
                    <label for="correo">Correo</label>
                    <div class="input-wrapper">
                        <svg class="icon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M3 6h18v12H3z"/>
                            <path d="M3 7l9 6 9-6"/>
                        </svg>
                        <input
                            type="email"
                            id="correo"
                            name="correo"
                            placeholder="tucorreo@ejemplo.com"
                            required>
                    </div>
                </div>

                <div class="input-group">
                    <label for="password">Contraseña</label>
                    <div class="input-wrapper">
                        <svg class="icon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <rect x="4" y="10" width="16" height="10" rx="2"/>
                            <path d="M8 10V7a4 4 0 018 0v3"/>
                        </svg>
                        <input
                            type="password"
                            id="password"
                            name="password"
                            placeholder="********"
                            required>
                        <button type="button" class="toggle-password" onclick="togglePassword()">
                            <svg class="icon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M1 12s4-7 11-7 11 7 11 7-4 7-11 7-11-7-11-7z"/>
                                <circle cx="12" cy="12" r="3"/>
                            </svg>
                        </button>
                    </div>
                </div>

                <button type="submit" class="btn-primary">
                    Ingresar
                </button>

                <div class="divider">o</div>

                <div class="links">
                    <a href="recover.jsp">¿Olvidaste tu contraseña?</a>
                    <span class="sep">|</span>
                    <a href="registro.jsp">Crear cuenta</a>
                </div>

            </form>

        </div>

    </div>

    <script>
        function togglePassword() {
            const input = document.getElementById('password');
            input.type = input.type === 'password' ? 'text' : 'password';
        }
    </script>

</body>
</html>