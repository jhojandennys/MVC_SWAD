/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Usuario;

/**
 *
 * @author Estudiante
 */
@WebServlet(name = "Procesa", urlPatterns = {"/Procesa"})
public class Procesa extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String grupo = request.getParameter("grupo");
        String opcion = request.getParameter("opcion");
        String id = request.getParameter("cliente_id");
        String contraseña = request.getParameter("cliente_password");
        String nombre = request.getParameter("cliente_nombre");
        String correo = request.getParameter("cliente_direccion");
        int telefono = Integer.parseInt(request.getParameter("cliente_telefono"));
        Usuario cli = new Usuario();
        if (grupo != null && grupo.equals("cliente")) {
            if (opcion != null && opcion.equals("agregar")) {

                cli.createUser(id, contraseña, nombre, correo, telefono);
                request.getRequestDispatcher("dashboard.jsp?grupo=usuario&opcion=null").forward(request, response);

            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String grupo = request.getParameter("grupo");
        String opcion = request.getParameter("opcion");
        String cliente_id = request.getParameter("cliente_id");
        if (grupo != null && grupo.equals("cliente")) {
            if (opcion != null && opcion.equals("agregar")) {
                request.getRequestDispatcher("dashboard.jsp?grupo=usuario&opcion=agregar").forward(request, response);
            }
            if (opcion != null && opcion.equals("editar")) {
                request.getRequestDispatcher("dashboard.jsp?grupo=cliente&opcion=editar&cliente_id=" + cliente_id).forward(request, response);
            }
        }
    }
}
