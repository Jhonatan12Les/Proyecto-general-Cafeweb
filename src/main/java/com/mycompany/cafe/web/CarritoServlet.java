package com.mycompany.cafe.web;

import com.mycompany.cafe.model.ItemCarrito;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CarritoServlet")
public class CarritoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession();

        @SuppressWarnings("unchecked")
        List<ItemCarrito> carrito = (List<ItemCarrito>) sesion.getAttribute("carrito");

        if (carrito == null) {
            carrito = new ArrayList<>();
            sesion.setAttribute("carrito", carrito);
        }

        String accion = request.getParameter("accion");

        if ("agregar".equals(accion)) {

            String nombre = request.getParameter("nombre");
            String imagen = request.getParameter("imagen");
            double precio = Double.parseDouble(request.getParameter("precio"));

            ItemCarrito existente = buscarPorNombre(carrito, nombre);

            if (existente != null) {
                existente.setCantidad(existente.getCantidad() + 1);
            } else {
                carrito.add(new ItemCarrito(nombre, precio, imagen));
            }

        } else if ("aumentar".equals(accion)) {

            String nombre = request.getParameter("nombre");
            ItemCarrito item = buscarPorNombre(carrito, nombre);

            if (item != null) {
                item.setCantidad(item.getCantidad() + 1);
            }

        } else if ("disminuir".equals(accion)) {

            String nombre = request.getParameter("nombre");
            ItemCarrito item = buscarPorNombre(carrito, nombre);

            if (item != null) {
                item.setCantidad(item.getCantidad() - 1);

                if (item.getCantidad() <= 0) {
                    carrito.remove(item);
                }
            }

        } else if ("eliminar".equals(accion)) {

            String nombre = request.getParameter("nombre");
            carrito.removeIf(i -> i.getNombre().equals(nombre));

        } else if ("vaciar".equals(accion)) {

            carrito.clear();
        }

        int totalItems = 0;

        for (ItemCarrito i : carrito) {
            totalItems += i.getCantidad();
        }

        // Si la peticion viene del boton "Agregar" del catalogo (AJAX),
        // solo respondemos el numero para actualizar el contador sin recargar la pagina
        if ("agregar".equals(accion) && "xhr".equals(request.getParameter("origen"))) {
            response.setContentType("text/plain;charset=UTF-8");
            response.getWriter().print(totalItems);
            return;
        }

        // En cualquier otro caso (desde la pagina del carrito), volvemos ahi
        response.sendRedirect(request.getContextPath() + "/views/carrito.jsp");
    }

    private ItemCarrito buscarPorNombre(List<ItemCarrito> carrito, String nombre) {

        for (ItemCarrito i : carrito) {
            if (i.getNombre().equals(nombre)) {
                return i;
            }
        }

        return null;
    }
}