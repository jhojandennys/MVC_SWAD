/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cliente;

/**
 *
 * @author Estudiante
 */
@WebServlet(name = "Cliente", urlPatterns = {"/Cliente", "/Cliente/add", "/Cliente/edit", "/Cliente/delete"})
public class ClienteController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        switch (action) {
            case "/Cliente/add":
                handleAddCliente(request, response);
                break;
            case "/Cliente/edit":
                handleEditCliente(request, response);
                break;
            case "/Cliente/delete":
                handleDeleteCliente(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        switch (action) {
            case "/Cliente/add":
                request.getRequestDispatcher("/admin/index.jsp?pagina=cliente").forward(request, response);
                break;
            case "/Cliente/edit":
                request.getRequestDispatcher("/admin/index.jsp?pagina=cliente").forward(request, response);
                break;
            case "/Cliente/delete":
                request.getRequestDispatcher("/admin/index.jsp?pagina=cliente").forward(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }
    private void handleAddCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Aquí se maneja la lógica para agregar un usuario
        // Los parámetros se obtienen del request como en tu código original
        String nombre = request.getParameter("nombre");
        String apellPaterno = request.getParameter("apaterno");
        String apellMaterno = request.getParameter("amaterno");
        String telf = request.getParameter("telefono");
        String direc = request.getParameter("direccion");
        String dni = request.getParameter("dni");
       

        System.out.println("***************AQUI ANTES DE CREAR***************");
        Cliente cl = new Cliente();
        cl.createCliente(nombre, apellPaterno,apellMaterno,telf,direc,dni);
        System.out.println("***************DESPUES DE CREAR***************");
        request.getRequestDispatcher("/admin/index.jsp?pagina=cliente").forward(request, response);
    }

    private void handleDeleteCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");

        System.out.println("***************AQUI ANTES DE ELIMINAR***************");
        Cliente cl = new Cliente();
        cl.deleteCliente(id);
        System.out.println("***************DESPUES DE ELIMINAR***************");
        request.getRequestDispatcher("/admin/index.jsp?pagina=cliente").forward(request, response);
    }

    private void handleEditCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String id = request.getParameter("id");
       String nombre = request.getParameter("nombre");
        String apellPaterno = request.getParameter("apaterno");
        String apellMaterno = request.getParameter("amaterno");
        String telf = request.getParameter("telefono");
        String direc = request.getParameter("direccion");
        String dni = request.getParameter("dni");

        System.out.println("***************AQUI ANTES DE EDITAR***************");
        Cliente cl = new Cliente();
        cl.editCliente(id,nombre, apellPaterno,apellMaterno,telf,direc,dni);
        System.out.println("***************DESPUES DE EDITAR***************");
        request.getRequestDispatcher("/admin/index.jsp?pagina=cliente").forward(request, response);
    }
}
