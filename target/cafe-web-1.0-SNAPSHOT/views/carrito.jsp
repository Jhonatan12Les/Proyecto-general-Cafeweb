<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.cafe.model.ItemCarrito" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
    List<ItemCarrito> carrito = (List<ItemCarrito>) session.getAttribute("carrito");

    if (carrito == null) {
        carrito = new ArrayList<>();
    }

    double total = 0;
    int totalItems = 0;

    for (ItemCarrito item : carrito) {
        total += item.getSubtotal();
        totalItems += item.getCantidad();
    }

    Boolean pedidoConfirmado = (Boolean) session.getAttribute("pedidoConfirmado");

    if (pedidoConfirmado != null && pedidoConfirmado) {
        session.removeAttribute("pedidoConfirmado");
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tu carrito - Café Jhona</title>

    <link rel="stylesheet" href="../css/base.css">
    <link rel="stylesheet" href="../css/carrito.css">
</head>
<body>

<a href="../index.jsp" class="btn-home">Café Jhona</a>

<div class="carrito-container">

    <h1>Tu carrito de compras</h1>

    <% if (pedidoConfirmado != null && pedidoConfirmado) { %>
    <div class="aviso-exito">
        ¡Tu pedido fue realizado con éxito! Pronto nos pondremos en contacto contigo.
    </div>
    <% } %>

    <% if (carrito.isEmpty()) { %>

        <div class="carrito-vacio">
            <p>Tu carrito está vacío.</p>
            <a href="../index.jsp#catalogo" class="btn">Ver catálogo</a>
        </div>

    <% } else { %>

        <div class="carrito-items">

            <% for (ItemCarrito item : carrito) { %>

            <div class="carrito-item">

                <img src="<%= item.getImagen() %>" alt="<%= item.getNombre() %>">

                <div class="item-info">
                    <h3><%= item.getNombre() %></h3>
                    <span class="precio-unitario">
                        $<%= String.format("%,.0f", item.getPrecio()) %> c/u
                    </span>
                </div>

                <div class="item-cantidad">

                    <form action="${pageContext.request.contextPath}/CarritoServlet" method="post">
                        <input type="hidden" name="accion" value="disminuir">
                        <input type="hidden" name="nombre" value="<%= item.getNombre() %>">
                        <button type="submit" class="btn-cantidad">-</button>
                    </form>

                    <span><%= item.getCantidad() %></span>

                    <form action="${pageContext.request.contextPath}/CarritoServlet" method="post">
                        <input type="hidden" name="accion" value="aumentar">
                        <input type="hidden" name="nombre" value="<%= item.getNombre() %>">
                        <button type="submit" class="btn-cantidad">+</button>
                    </form>

                </div>

                <div class="item-subtotal">
                    $<%= String.format("%,.0f", item.getSubtotal()) %>
                </div>

                <form action="${pageContext.request.contextPath}/CarritoServlet" method="post">
                    <input type="hidden" name="accion" value="eliminar">
                    <input type="hidden" name="nombre" value="<%= item.getNombre() %>">
                    <button type="submit" class="btn-eliminar" title="Eliminar">
                        &times;
                    </button>
                </form>

            </div>

            <% } %>

        </div>

        <div class="carrito-resumen">

            <div class="resumen-linea">
                <span>Productos (<%= totalItems %>)</span>
                <span>$<%= String.format("%,.0f", total) %></span>
            </div>

            <div class="resumen-linea total">
                <span>Total</span>
                <span>$<%= String.format("%,.0f", total) %></span>
            </div>

            <form action="${pageContext.request.contextPath}/PedidoServlet" method="post">
                <button type="submit" class="btn btn-pedido">
                    Realizar pedido
                </button>
            </form>

            <form action="${pageContext.request.contextPath}/CarritoServlet" method="post">
                <input type="hidden" name="accion" value="vaciar">
                <button type="submit" class="btn-vaciar">
                    Vaciar carrito
                </button>
            </form>

        </div>

    <% } %>

</div>

</body>
</html>