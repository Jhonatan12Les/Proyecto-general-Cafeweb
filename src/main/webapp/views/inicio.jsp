<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.cafe.model.Usuario" %>
<%
    // Guardia de sesion: si no hay usuario autenticado, se redirige al login
    Usuario usuarioSesion = (Usuario) session.getAttribute("usuario");

    if (usuarioSesion == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio - Café Jhona</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/inicio.css">
</head>
<body>

<header class="dashboard-navbar">

    <div class="logo">Café Jhona</div>

    <nav>
        <ul>
            <li><a href="#catalogo">Catálogo</a></li>

            <li>
                <div class="user-chip">
                    <div class="avatar"><%= usuarioSesion.getNombre().substring(0, 1).toUpperCase() %></div>
                    <span><%= usuarioSesion.getNombre() %></span>
                </div>
            </li>

            <li>
                <a href="${pageContext.request.contextPath}/LogoutServlet"
                   class="btn-logout">
                    Cerrar sesión
                </a>
            </li>
        </ul>
    </nav>

</header>

<main>

    <section class="bienvenida">
        <h1>¡Bienvenido, <%= usuarioSesion.getNombre() %>!</h1>

        <p>
            Nos alegra tenerte de vuelta. Explora nuestro catálogo de panadería
            y café en grano, y realiza tu pedido en segundos.
        </p>

        <a href="#catalogo" class="btn-pedido">Realizar pedido ahora</a>
    </section>

    <section id="catalogo" class="catalogo-section">

        <div class="catalogo-header">
            <h2>Nuestro catálogo</h2>
        </div>

        <div class="categoria-bloque">
            <h3 class="categoria-titulo">🥐 Panadería</h3>

            <div class="grid-productos">

                <div class="producto-card">
                    <img src="https://images.unsplash.com/photo-1509440159596-0249088772ff?auto=format&fit=crop&w=400&q=80"
                         alt="Croissant artesanal">
                    <div class="producto-info">
                        <h3>Croissant artesanal</h3>
                        <p class="descripcion">Hojaldre mantequilloso horneado a diario.</p>
                        <div class="producto-footer">
                            <span class="precio">$4.500</span>
                            <button class="btn-agregar">Agregar</button>
                        </div>
                    </div>
                </div>

                <div class="producto-card">
                    <img src="https://images.unsplash.com/photo-1601050690597-df0568f70950?auto=format&fit=crop&w=400&q=80"
                         alt="Empanada de queso">
                    <div class="producto-info">
                        <h3>Empanada de queso</h3>
                        <p class="descripcion">Perfecta acompañante para tu tinto.</p>
                        <div class="producto-footer">
                            <span class="precio">$3.000</span>
                            <button class="btn-agregar">Agregar</button>
                        </div>
                    </div>
                </div>

                <div class="producto-card">
                    <img src="https://images.unsplash.com/photo-1509440159596-0249088772ff?auto=format&fit=crop&w=400&q=80"
                         alt="Pan de bono">
                    <div class="producto-info">
                        <h3>Pan de bono</h3>
                        <p class="descripcion">Suave, esponjoso y recién horneado.</p>
                        <div class="producto-footer">
                            <span class="precio">$2.500</span>
                            <button class="btn-agregar">Agregar</button>
                        </div>
                    </div>
                </div>

                <div class="producto-card">
                    <img src="https://images.unsplash.com/photo-1509365465985-25d11c17e812?auto=format&fit=crop&w=400&q=80"
                         alt="Muffin de arándanos">
                    <div class="producto-info">
                        <h3>Muffin de arándanos</h3>
                        <p class="descripcion">Relleno de fruta natural en cada bocado.</p>
                        <div class="producto-footer">
                            <span class="precio">$5.000</span>
                            <button class="btn-agregar">Agregar</button>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div class="categoria-bloque">
            <h3 class="categoria-titulo">☕ Bolsas de café</h3>

            <div class="grid-productos">

                <div class="producto-card">
                    <img src="https://images.unsplash.com/photo-1447933601403-0c6688de566e?auto=format&fit=crop&w=400&q=80"
                         alt="Café tostado medio 500g">
                    <div class="producto-info">
                        <h3>Tostado medio · 500g</h3>
                        <p class="descripcion">Grano 100% colombiano, notas a chocolate.</p>
                        <div class="producto-footer">
                            <span class="precio">$28.000</span>
                            <button class="btn-agregar">Agregar</button>
                        </div>
                    </div>
                </div>

                <div class="producto-card">
                    <img src="https://images.unsplash.com/photo-1442512595331-e89e73853f31?auto=format&fit=crop&w=400&q=80"
                         alt="Café tostado oscuro 500g">
                    <div class="producto-info">
                        <h3>Tostado oscuro · 500g</h3>
                        <p class="descripcion">Cuerpo intenso, ideal para espresso.</p>
                        <div class="producto-footer">
                            <span class="precio">$28.000</span>
                            <button class="btn-agregar">Agregar</button>
                        </div>
                    </div>
                </div>

                <div class="producto-card">
                    <img src="https://images.unsplash.com/photo-1524350876685-274059332603?auto=format&fit=crop&w=400&q=80"
                         alt="Café molido premium 250g">
                    <div class="producto-info">
                        <h3>Molido premium · 250g</h3>
                        <p class="descripcion">Listo para tu cafetera de casa.</p>
                        <div class="producto-footer">
                            <span class="precio">$16.000</span>
                            <button class="btn-agregar">Agregar</button>
                        </div>
                    </div>
                </div>

                <div class="producto-card">
                    <img src="https://images.unsplash.com/photo-1559056199-641a0ac8b55e?auto=format&fit=crop&w=400&q=80"
                         alt="Café en grano orgánico 1kg">
                    <div class="producto-info">
                        <h3>Orgánico en grano · 1kg</h3>
                        <p class="descripcion">Cultivo sostenible de fincas locales.</p>
                        <div class="producto-footer">
                            <span class="precio">$52.000</span>
                            <button class="btn-agregar">Agregar</button>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </section>

</main>

<footer class="dashboard-footer">
    <p>&copy; 2025 Café Jhona &middot; Disfruta el mejor café colombiano</p>
</footer>

</body>
</html>