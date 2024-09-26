/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Usuario;

/**
 *
 * @author GianH
 */
@WebServlet(name = "Auth", urlPatterns = {"/auth", "/auth/"})
public class Autentica extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        System.out.println("llega POST LOGIN");
        switch (accion) {
            case "validar":
                validar(request, response);
                break;
            case "cerrar":
                cerrar(request, response);
                break;
            default:
                break;
        }

    }

    public void validar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");
        Usuario cli = new Usuario();

        cli = cli.authenticate(correo, password);
        HttpSession sesion = request.getSession();

        if (cli.getRol().getId() > 0) { // Si el usuario está autenticado
            sesion.setAttribute("userlog", correo);
            sesion.setAttribute("idUsuario", cli.getId());

            switch (cli.getRol().getId().toString()) {
                case "1":
                    response.sendRedirect(request.getContextPath() + "/admin?pagina=dashboard");
                    break;
                case "2":
                    response.sendRedirect(request.getContextPath() + "/vendedor?pagina=dashboard");
                    break;
                case "3":
                    response.sendRedirect(request.getContextPath() + "/transportista?pagina=dashboard");
                    break;
            }
        } else {
            // Establecer mensajes de error y enviar el correo de vuelta a la página de login
            request.setAttribute("correo", correo);
            request.setAttribute("pass", password);
            if (cli.getRol().getId() == -1) {
                request.setAttribute("error", "Correo no registrado.");
            } else if (cli.getRol().getId() == -2) {
                request.setAttribute("error", "Contraseña incorrecta.");
            }
            request.getRequestDispatcher("/auth/login.jsp").forward(request, response);
        }
    }

    public void cerrar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("userlog", null);
        session.invalidate();
        response.sendRedirect("/auth/login.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //response.sendRedirect(request.getContextPath() + "/admin/index.jsp?pagina=dashboard");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "GET method is not supported for this route.");

    }
}
