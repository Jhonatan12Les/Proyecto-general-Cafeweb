<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cuenta creada con éxito - Café Jhona</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aviso.css">
</head>
<body>

    <a href="${pageContext.request.contextPath}/index.jsp" class="btn-home">
        Café Jhona
    </a>

    <div class="auth-container">

        <div class="auth-card">

            <div class="aviso-icono aviso-icono-exito">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M20 6L9 17l-5-5"/>
                </svg>
            </div>

            <h1>¡Cuenta creada con éxito!</h1>

            <p class="descripcion">
                Tu registro se completó correctamente.
                Ya puedes iniciar sesión para explorar el catálogo y realizar tus pedidos.
            </p>

            <div class="aviso-acciones">
                <a href="${pageContext.request.contextPath}/views/login.jsp" class="btn">
                    Iniciar sesión
                </a>
            </div>

        </div>

    </div>

</body>
</html>