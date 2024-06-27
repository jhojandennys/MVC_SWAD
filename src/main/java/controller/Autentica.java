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
 * @author Estudiante
 */
@WebServlet(name = "Autentica", urlPatterns = {"/Autentica"})
public class Autentica extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Usuario cli = new Usuario();
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");

        int log = cli.authenticate(correo, password);
        if (log == 1) {
            HttpSession sesion = request.getSession();
            sesion.setAttribute("userlog", correo);
            // cli.createUser("soluciones", "web123", "UPN", "El sol 461", 999888777);
            request.getRequestDispatcher("admin.jsp?pagina=dashboard").forward(request, response);
        } else {
            request.getRequestDispatcher("index.jsp").forward(request, response);
            
        }
    }
}

