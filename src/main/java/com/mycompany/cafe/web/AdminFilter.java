
package com.mycompany.cafe.web;

import com.mycompany.cafe.model.Usuario;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter({
    "/AdminServlet",
    "/views/admin.jsp",
    "/views/admin/*"  // Protege también subcarpetas de admin si las tienes
})
public class AdminFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Inicialización del filtro (opcional)
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession sesion = req.getSession(false); // No crear sesión si no existe

        // Verificar si el usuario está autenticado y es administrador
        Usuario usuario = (sesion != null) ? (Usuario) sesion.getAttribute("usuario") : null;

        if (usuario == null || !usuario.esAdmin()) {
            // Si no es admin, redirigir al login con mensaje de error
            res.sendRedirect(req.getContextPath() + "/views/login.jsp?error=acceso_denegado");
            return;
        }

        // Si es admin, continuar con la petición
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Limpieza del filtro (opcional)
    }
}