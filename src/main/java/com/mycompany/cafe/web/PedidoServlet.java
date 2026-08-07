package com.mycompany.cafe.web;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/PedidoServlet")
public class PedidoServlet extends HttpServlet {

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    HttpSession sesion = request.getSession();

    // Si no hay un usuario autenticado, no se puede confirmar el pedido
    if (sesion.getAttribute("usuario") == null) {

        // Guardamos a donde debe volver una vez inicie sesion
        sesion.setAttribute("redirectDespuesLogin", request.getContextPath() + "/views/carrito.jsp");

        response.sendRedirect(request.getContextPath() + "/views/pedido-requiere-login.jsp");
        return;
    }

    // Marca el pedido como confirmado y vacia el carrito actual
    sesion.setAttribute("pedidoConfirmado", true);
    sesion.setAttribute("carrito", new ArrayList<>());

    response.sendRedirect(request.getContextPath() + "/views/carrito.jsp");
}
}