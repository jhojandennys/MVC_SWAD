/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Servicio;

/**
 *
 * @author Chavez
 */
@WebServlet(name = "Servicios", urlPatterns = {"/Servicios"})
public class ServicioController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        switch (action) {
            case "/Servicios/add":
                //handleAddUser(request, response);
                break;
            case "/Servicios/edit":
                //handleEditUser(request, response);
                break;
            case "/Servicios/delete":
                //handlDeleteUser(request, response);
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
            case "/Servicios/add":
            case "/Servicios/edit":
            case "/Servicios/delete":
                request.getRequestDispatcher("/admin/index.jsp?pagina=servicios").forward(request, response);
                break;
            case "/Servicios":
                handleGetServicios(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }

    private void handleGetServicios(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Servicio sv = new Servicio();
        List<Servicio> servicios = sv.getServicios();

        Gson gson = new Gson();
        String jsServicios = gson.toJson(servicios);

        // Configurar la respuesta
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsServicios);
    }
}
