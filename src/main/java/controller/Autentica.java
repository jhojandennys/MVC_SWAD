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
@WebServlet(name = "Auth", urlPatterns = {"/Auth"})
public class Autentica extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
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
        Usuario cli = new Usuario();
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");

        cli = cli.authenticate(correo, password);
        HttpSession sesion = request.getSession();
        sesion.setAttribute("userlog", correo);
        sesion.setAttribute("idUsuario", cli.getId());
        switch (cli.getRol().getId().toString()) {
            case "1":
                // cli.createUser("soluciones", "web123", "UPN", "El sol 461", 999888777);
                response.sendRedirect(request.getContextPath() + "/admin?pagina=dashboard");
                break;
            case "2":
                response.sendRedirect(request.getContextPath() + "/vendedor?pagina=dashboard");
                break;
            case "3":
                response.sendRedirect(request.getContextPath() + "/transportista?pagina=dashboard");
                break;
            default:
                request.getRequestDispatcher("/auth/login.jsp").forward(request, response);
                break;
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
        response.sendRedirect(request.getContextPath() + "/admin/index.jsp?pagina=dashboard");

    }
}
