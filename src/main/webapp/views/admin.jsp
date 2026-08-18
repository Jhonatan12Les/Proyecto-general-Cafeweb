<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.cafe.model.Usuario" %>
<%@ page import="com.mycompany.cafe.model.Producto" %>
<%@ page import="java.util.List" %>
<%
    List<Usuario> usuarios = (List<Usuario>) request.getAttribute("usuarios");
    List<Producto> productos = (List<Producto>) request.getAttribute("productos");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de administración - Café Jhona</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
</head>
<body>

<header class="dashboard">
    <div class="logo">Café Jhona · Admin</div>
    <nav class="menu">
        <ul>
            <li><a href="${pageContext.request.contextPath}/LogoutServlet" class="btn-nav">Cerrar sesión</a></li>
        </ul>
    </nav>
</header>

<main class="admin-container">

    <section class="admin-bloque">
        <h2>Usuarios registrados (<%= usuarios.size() %>)</h2>

        <table class="admin-tabla">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Correo</th>
                    <th>Cédula</th>
                    <th>Rol</th>
                </tr>
            </thead>
            <tbody>
                <% for (Usuario u : usuarios) { %>
                <tr>
                    <td><%= u.getNombre() %> <%= u.getApellido() %></td>
                    <td><%= u.getCorreo() %></td>
                    <td><%= u.getCedula() %></td>
                    <td><span class="badge-rol"><%= u.getRol() %></span></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </section>

    <section class="admin-bloque">
        <h2>Agregar producto al inventario</h2>

        <form action="${pageContext.request.contextPath}/AdminServlet" method="post" class="form-producto">
            <input type="hidden" name="accion" value="crearProducto">

            <input type="text" name="nombre" placeholder="Nombre del producto" required>
            <input type="text" name="descripcion" placeholder="Descripción">
            <input type="number" step="0.01" name="precio" placeholder="Precio" required>
            <input type="number" name="stock" placeholder="Stock inicial" required>
            <input type="text" name="imagen" placeholder="URL de la imagen">
            <select name="categoria" required>
                <option value="">Categoría</option>
                <option value="Panadería">Panadería</option>
                <option value="Café">Café</option>
            </select>

            <button type="submit" class="btn">Agregar producto</button>
        </form>
    </section>

    <section class="admin-bloque">
        <h2>Inventario (<%= productos.size() %> productos)</h2>

        <table class="admin-tabla">
            <thead>
                <tr>
                    <th>Producto</th>
                    <th>Categoría</th>
                    <th>Precio</th>
                    <th>Stock</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <% for (Producto p : productos) { %>
                <tr>
                    <td><%= p.getNombre() %></td>
                    <td><%= p.getCategoria() %></td>
                    <td>$<%= String.format("%,.0f", p.getPrecio()) %></td>
                    <td>
                        <form action="${pageContext.request.contextPath}/AdminServlet" method="post" class="form-inline">
                            <input type="hidden" name="accion" value="actualizarStock">
                            <input type="hidden" name="idProducto" value="<%= p.getId() %>">
                            <input type="number" name="stock" value="<%= p.getStock() %>" class="input-stock">
                            <button type="submit" class="btn-mini">Actualizar</button>
                        </form>
                    </td>
                    <td>
                        <form action="${pageContext.request.contextPath}/AdminServlet" method="post">
                            <input type="hidden" name="accion" value="eliminarProducto">
                            <input type="hidden" name="idProducto" value="<%= p.getId() %>">
                            <button type="submit" class="btn-mini btn-eliminar">Eliminar</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </section>

</main>

</body>
</html>