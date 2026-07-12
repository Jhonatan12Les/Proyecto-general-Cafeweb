<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión - Café Jhona</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/login.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/styles.css">
</head>

<body>

    <a href="${pageContext.request.contextPath}/index.jsp"
       class="btn-home">
        Café Jhona
    </a>

    <div class="login-container">

        <div class="login-image">

            <img
                src="https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&w=800&q=80"
                alt="Café">

            <div class="overlay"></div>

        </div>

        <div class="login-form">

            <h1>Café Jhona</h1>
            <h2>Bienvenido de nuevo</h2>

           <form action="${pageContext.request.contextPath}/LoginServlet" method="post">

                <div class="input-group">

                    <label for="correo">
                        Correo
                    </label>

                    <input
                        type="email"
                        id="correo"
                        name="correo"
                        required>

                </div>

                <div class="input-group">

                    <label for="password">
                        Contraseña
                    </label>

                    <input
                        type="password"
                        id="password"
                        name="password"
                        required>

                </div>

                <button
                    type="submit"
                    class="btn-primary">

                    Ingresar

                </button>

                <div class="links">

                    <a href="recover.jsp">
                        ¿Olvidaste tu contraseña?
                    </a>

                    <span> | </span>

                    <a href="registro.jsp">
                        Crear cuenta
                    </a>

                </div>

            </form>

        </div>

    </div>

</body>
</html>