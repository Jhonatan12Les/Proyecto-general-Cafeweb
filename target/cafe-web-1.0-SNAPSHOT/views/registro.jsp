<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de usuario - Café Jhona</title>

    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>

    <a href="../index.jsp" class="btn-home">
        Café Jhona
    </a>

    <div class="login-container">

        <div class="login-box">

            <h1 class="titulo">
                Crear cuenta
            </h1>

            <p class="descripcion">
                Registrate para disfrutar del mejor café y realizar tus pedidos en línea.
            </p>

            <form action="${pageContext.request.contextPath}/RegistroServlet" method="post">

                <div class="input-group">
                    <label for="nombre">Nombre</label>
                    <input
                        type="text"
                        id="nombre"
                        name="nombre"
                        placeholder="Tu nombre"
                        required>
                </div>

                <div class="input-group">
                    <label for="apellido">Apellido</label>
                    <input
                        type="text"
                        id="apellido"
                        name="apellido"
                        placeholder="Tu apellido"
                        required>
                </div>

                <div class="input-group">
                    <label for="cedula">Cédula</label>
                    <input
                        type="number"
                        id="cedula"
                        name="cedula"
                        placeholder="Tu número de cédula"
                        required>
                </div>

                <div class="input-group">
                    <label for="fecha">Fecha de nacimiento</label>
                    <input
                        type="date"
                        id="fecha"
                        name="fecha"
                        required>
                </div>

                <div class="input-group">
                    <label for="correo">Correo electronico</label>
                    <input
                        type="email"
                        id="correo"
                        name="correo"
                        placeholder="ejemplo@correo.com"
                        required>
                </div>

                <div class="input-group">
                    <label for="password">Contraseña</label>
                    <input
                        type="password"
                        id="password"
                        name="password"
                        placeholder="Crea una contraseña segura"
                        required>
                </div>

                <button type="submit" class="btn">
                    Crear cuenta
                </button>

            </form>

            <div class="extra-links">
                <p>
                    ¿Ya tienes una cuenta?
                    <a href="login.jsp">
                        Inicia sesión aquí
                    </a>
                </p>
            </div>

        </div>

    </div>

</body>
</html>