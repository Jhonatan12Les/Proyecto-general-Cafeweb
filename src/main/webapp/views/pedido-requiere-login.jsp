<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicia sesión para continuar - Café Jhona</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aviso.css">
</head>
<body>

    <a href="${pageContext.request.contextPath}/index.jsp" class="btn-home">
        Café Jhona
    </a>

    <div class="auth-container">

        <div class="auth-card">

            <div class="aviso-icono">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <rect x="4" y="10" width="16" height="10" rx="2"/>
                    <path d="M8 10V7a4 4 0 018 0v3"/>
                </svg>
            </div>

            <h1>Inicia sesión para continuar</h1>

            <p class="descripcion">
                Para confirmar tu pedido necesitas iniciar sesión.
                No te preocupes, tu carrito se mantiene guardado.
            </p>

            <div class="aviso-acciones">
                <a href="${pageContext.request.contextPath}/views/login.jsp" class="btn">
                    Iniciar sesión
                </a>
                <a href="${pageContext.request.contextPath}/views/registro.jsp" class="btn-secundario">
                    Crear una cuenta
                </a>
                <a href="${pageContext.request.contextPath}/views/carrito.jsp" class="btn-secundario">
                    Volver al carrito
                </a>
            </div>

        </div>

    </div>

</body>
</html>