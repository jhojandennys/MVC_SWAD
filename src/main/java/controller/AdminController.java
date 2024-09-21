package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author GianH
 */
@WebServlet(name = "/admin", urlPatterns = {"/admin", "/admin/"})
public class AdminController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pagina = request.getParameter("pagina");
        String accion = request.getParameter("accion");
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("userlog") != null) {
            String view = "index.jsp";
            if (pagina != null) {
                switch (pagina) {
                    case "dashboard":
                        view = "dashboard/index.jsp";
                        break;
                    case "usuario":
                        view = "user/list.jsp";
                        break;
                    case "rol":
                        view = "rol/list.jsp";
                        break;
                    case "cliente":
                        view = "client/list.jsp";
                        break;
                    case "almacen":
                        view = "almacen/list.jsp";
                        break;
                    case "proveedor":
                        view = "proveedor/list.jsp";
                        break;
                    case "transporte":
                        view = "transporte/list.jsp";
                        break;
                    case "categoria":
                        view = "category/list.jsp";
                        break;
                    case "producto":
                        view = "product/list.jsp";
                        break;
                    case "venta":
                        view = "venta/list.jsp";
                        break;
                    case "compra":
                        view = "compra/list.jsp";
                        break;
                    case "envio":
                        view = "envio/list.jsp";
                        break;
                    default:
                        view = "index.jsp";
                        break;
                }
            }
            request.setAttribute("view", view);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/index.jsp");
            dispatcher.forward(request, response); // Forward to the specific view
        } else {
            response.sendRedirect("../auth/login.jsp");
        }
    }

}