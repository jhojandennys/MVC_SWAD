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
import model.Categoria;

/**
 *
 * @author Chavez
 */
@WebServlet(name = "Categories", urlPatterns = {"/Categories", "/Categories/add", "/Categories/edit", "/Categories/delete"})
public class CategoryController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        switch (action) {
            case "/Categories/add":
                handleAddCategory(request, response);
                break;
            case "/Categories/edit":
                handleEditCategory(request, response);
                break;
            case "/Categories/delete":
                handlDeleteCategory(request, response);
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
            case "/Categories/add":
            case "/Categories/edit":
            case "/Categories/delete":
                request.getRequestDispatcher("/admin/index.jsp?pagina=categoria").forward(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }

    public void handleAddCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        System.out.println("***************AQUI ANTES DE CREAR***************");
        Categoria cat = new Categoria();
        cat.createCategory(nombre, descripcion);
        System.out.println("***************DESPUES DE CREAR***************");
        request.getRequestDispatcher("/admin/index.jsp?pagina=categoria").forward(request, response);
    }

    private void handlDeleteCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long id = Long.valueOf(request.getParameter("id"));
        System.out.println("***************AQUI ANTES DE ELIMINAR***************");
        Categoria rol = new Categoria();
        rol.deleteCategory(id);
        System.out.println("***************DESPUES DE ELIMINAR***************");
        request.getRequestDispatcher("/admin/index.jsp?pagina=categoria").forward(request, response);
    }

    private void handleEditCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long id = Long.valueOf(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        System.out.println("***************AQUI ANTES DE EDITAR***************");
        Categoria cat = new Categoria();
        cat.editCategory(id, nombre, descripcion);
        System.out.println("***************DESPUES DE EDITAR***************");
        request.getRequestDispatcher("/admin/index.jsp?pagina=categoria").forward(request, response);
    }
}
