package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Producto;

/**
 *
 * @author Estudiante
 */
@WebServlet(name = "Producto", urlPatterns = {"/Producto", "/Producto/add", "/Producto/edit", "/Producto/delete"})
public class ProductController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("userlog") != null) {
            switch (action) {
                case "/Producto/add":
                    handleAddProducto(request, response);
                    break;
                case "/Producto/edit":
                    handleEditProducto(request, response);
                    break;
                case "/Producto/delete":
                    handleDeleteProducto(request, response);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                    break;
            }
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        switch (action) {
            case "/Producto/add":
            case "/Producto/edit":
            case "/Producto/delete":
                HttpSession sesion = request.getSession();
                if (sesion.getAttribute("userlog") != null) {
                    response.sendRedirect("/admin?pagina=producto");
                    switch (sesion.getAttribute("rol").toString()) {
                        case "1":
                            response.sendRedirect("/admin?pagina=producto");
                            break;
                        case "2":
                            response.sendRedirect("/vendedor?pagina=productos");
                            break;
                        default:
                            response.sendError(HttpServletResponse.SC_NOT_FOUND);
                    }
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                }
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }

    private void handleAddProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Aquí se maneja la lógica para agregar un usuario
        // Los parámetros se obtienen del request como en tu código original
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        double preciocompra = Double.parseDouble(request.getParameter("pcompra"));
        double precioventa = Double.parseDouble(request.getParameter("pventa"));
        //String imagen = request.getParameter("imagen");
        String imagen = "  ";
        int idCategoria = Integer.parseInt(request.getParameter("categoria"));
        int idProveedor = Integer.parseInt(request.getParameter("proveedor"));
        int idEstado = Integer.parseInt(request.getParameter("estado"));

        System.out.println("***************AQUI ANTES DE CREAR***************");
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("userlog") != null) {

            Producto prod = new Producto();
            prod.createProduct(nombre, descripcion, idCategoria,
                    idProveedor, idEstado, preciocompra,
                    precioventa, imagen
            );
            System.out.println("***************DESPUES DE CREAR***************");

            switch (sesion.getAttribute("rol").toString()) {
                case "1":
                    response.sendRedirect("/admin?pagina=producto");
                    break;
                case "2":
                    response.sendRedirect("/vendedor?pagina=productos");
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }

    }

    private void handleDeleteProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");

        System.out.println("***************AQUI ANTES DE ELIMINAR***************");
        Producto prod = new Producto();
        prod.deleteProduct(id);
        System.out.println("***************DESPUES DE ELIMINAR***************");
        response.sendRedirect("/admin?pagina=producto");
    }

    private void handleEditProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String descripcion = request.getParameter("descripcion");
        String nombre = request.getParameter("nombre");
        int idCategoria = Integer.parseInt(request.getParameter("categoria"));
        int idProveedor = Integer.parseInt(request.getParameter("proveedor"));
        int idEstado = Integer.parseInt(request.getParameter("estado"));
        double preciocompra = Double.parseDouble(request.getParameter("pcompra"));
        double precioventa = Double.parseDouble(request.getParameter("pventa"));
        //  String imagen = request.getParameter("imagen");
        String imagen = "";
        System.out.println("***************AQUI ANTES DE EDITAR***************");
        Producto prod = new Producto();
        HttpSession sesion = request.getSession();
        String idModificador = sesion.getAttribute("idUsuario").toString();

        prod.editProduct(nombre, id, descripcion, idCategoria, idProveedor, idEstado, preciocompra, precioventa, imagen, idModificador);
        System.out.println("***************DESPUES DE EDITAR***************");
        response.sendRedirect("/admin?pagina=producto");
    }
}
