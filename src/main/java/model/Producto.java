/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import utilidades.Conexion;

/**
 *
 * @author Estudiante
 */
public class Producto {

    private Long id;

    private String nombre;

    private String descripcion;

    private double precioCompra;

    private double precioVenta;

    private String imagen;

    private Categoria categoria;

    private Proveedor proveedor;

    private EstadoProducto estado;

    public Producto() {
        categoria = new Categoria();
        proveedor = new Proveedor();
        estado = new EstadoProducto();
    }

    public int createProduct(String p_nombre,
            String p_descripcion, int p_idCategoria, int p_idProveedor,
            int p_idEstado, double p_preCompra, double p_preVenta, String p_img) {
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "INSERT INTO Productos (nombre, descripcion, precioCompra, precioVenta"
                    + ", idCategoria, idProveedor,idEstado,img,usuarioCreador,usuarioModificador) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?,?,?,?)";
            PreparedStatement sentencia = cnx.prepareStatement(query);
            sentencia.setString(1, p_nombre);
            sentencia.setString(2, p_descripcion);
            sentencia.setDouble(3, p_preCompra);
            sentencia.setDouble(4, p_preVenta);
            sentencia.setInt(5, p_idCategoria);
            sentencia.setInt(6, p_idProveedor);
            sentencia.setInt(7, p_idEstado);
            sentencia.setString(8, p_img);
            sentencia.setInt(9, 1);
            sentencia.setInt(10, 1);

            int filasInsertadas = sentencia.executeUpdate();
            sentencia.close();
            cnx.close();
            return filasInsertadas > 0 ? 1 : 0;
        } catch (SQLException e) {
            System.out.println("Error en createProducto: " + e.getMessage());
            return 0;
        }
    }

    public int editProduct(String p_nombre, String idProducto,
            String p_descripcion, int p_idCategoria, int p_idProveedor,
            int p_idEstado, double p_preCompra, double p_preVenta, String p_img, String idUser) {
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();

            String query = "UPDATE BDCamas.Productos\n"
                    + "SET \n"
                    + "    nombre = ?, \n"
                    + "    descripcion = ?, \n"
                    + "    precioCompra = ?, \n"
                    + "    precioVenta = ?, \n"
                    + "    idCategoria = ?, \n"
                    + "    img = ?, \n"
                    + "    idEstado = ?, \n"
                    + "    idProveedor = ?, \n"
                    + "    usuarioModificador = ?"
                    + "WHERE \n"
                    + "    id = ?; ";
            PreparedStatement sentencia = cnx.prepareStatement(query);

            sentencia.setString(1, p_nombre);
            sentencia.setString(2, p_descripcion);
            sentencia.setDouble(3, p_preCompra);
            sentencia.setDouble(4, p_preVenta);
            sentencia.setInt(5, p_idCategoria);
            sentencia.setString(6, p_img);
            sentencia.setInt(7, p_idEstado);
            sentencia.setInt(8, p_idProveedor);
            sentencia.setString(9, idUser);
            sentencia.setString(10, idProducto);
            int filasActualizadas = sentencia.executeUpdate();

            sentencia.close();
            cnx.close();

            return filasActualizadas > 0 ? 1 : 0;
        } catch (SQLException e) {
            System.out.println("Error en editProduct: " + e.getMessage());
            return 0;
        }
    }

    public int deleteProduct(String id) {
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();

            String query = "DELETE FROM productos WHERE id=?";
            PreparedStatement sentencia = cnx.prepareStatement(query);

            sentencia.setString(1, id);

            int filasEliminadas = sentencia.executeUpdate();

            sentencia.close();
            cnx.close();

            return filasEliminadas > 0 ? 1 : 0;
        } catch (SQLException e) {
            System.out.println("Error en deleteUser: " + e.getMessage());
            return 0;
        }
    }

    public List<Producto> getProducts() {
        List<Producto> lista = new ArrayList<>();
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "SELECT p.*,ep.id AS idEstado,ep.nombre AS estadoNombre, c.nombre AS categoriaNombre,c.id AS categoriaId, c.descripcion AS categoriaDescripcion, "
                    + "v.empresa AS proveedorEmpresa, v.correo AS proveedorCorreo,v.id AS proveedorId, v.ruc AS proveedorRuc, "
                    + "v.direccion AS proveedorDireccion, v.telefono AS proveedorTelefono "
                    + "FROM productos p "
                    + "JOIN categorias c ON p.idCategoria = c.id "
                    + "JOIN proveedores v ON p.idProveedor = v.id "
                    + "JOIN EstadosProducto ep ON p.idProveedor = ep.id";
            Statement sentencia = cnx.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            while (resultado.next()) {
                Producto prd = new Producto();
                prd.setId(resultado.getLong("id"));
                prd.setDescripcion(resultado.getString("descripcion"));
                prd.setNombre(resultado.getString("nombre"));
                prd.setPrecioCompra(resultado.getDouble("precioCompra"));
                prd.setPrecioVenta(resultado.getDouble("precioVenta"));

                prd.categoria.setId(resultado.getLong("categoriaId"));
                prd.categoria.setNombre(resultado.getString("categoriaNombre"));
                prd.categoria.setDescripcion(resultado.getString("categoriaDescripcion"));

                prd.estado.setId(resultado.getLong("idEstado"));
                prd.estado.setNombre(resultado.getString("estadoNombre"));
                prd.proveedor.setId(resultado.getLong("proveedorId"));
                prd.proveedor.setEmpresa(resultado.getString("proveedorEmpresa"));
                prd.proveedor.setCorreo(resultado.getString("proveedorCorreo"));
                prd.proveedor.setRuc(resultado.getString("proveedorRuc"));
                prd.proveedor.setDireccion(resultado.getString("proveedorDireccion"));
                prd.proveedor.setTelefono(resultado.getString("proveedorTelefono"));

                lista.add(prd);
            }
            sentencia.close();
            cnx.close();
            return lista;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return null;
    }

    public List<Producto> getProductosByCategoriaId(int idCategoria) {
        List<Producto> productos = new ArrayList<>();
        String sql = "SELECT p.id, p.nombre, p.descripcion, p.precioCompra, p.precioVenta, "
                + "c.nombre AS categoria, e.nombre AS estado, pr.empresa AS proveedor, "
                + "p.img, p.fechaCreación, p.fechaModificación "
                + "FROM Productos p "
                + "JOIN Categorias c ON p.idCategoria = c.id "
                + "JOIN EstadosProducto e ON p.idEstado = e.id "
                + "JOIN Proveedores pr ON p.idProveedor = pr.id "
                + "WHERE p.idCategoria = ?";
        Conexion c = new Conexion();
        Connection cnx = c.conecta();
        try (PreparedStatement stmt = cnx.prepareStatement(sql)) {
            stmt.setInt(1, idCategoria);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Producto producto = new Producto();
                    producto.setId(rs.getLong("id"));
                    producto.setNombre(rs.getString("nombre"));
                    producto.setDescripcion(rs.getString("descripcion"));
                    producto.setPrecioCompra(rs.getDouble("precioCompra"));
                    producto.setPrecioVenta(rs.getDouble("precioVenta"));
                    producto.categoria.setId(Long.valueOf(idCategoria));
                    producto.categoria.setNombre(rs.getString("categoria"));  // Nombre de la categoría
                    producto.estado.setNombre(rs.getString("estado"));        // Estado del producto
                    producto.proveedor.setEmpresa(rs.getString("proveedor"));  // Empresa del proveedor
                    productos.add(producto);
                }
            }
        } catch (SQLException e) {

            System.out.println("Error en obtenerProductoPorCategoria: " + e.getMessage());
        }
        return productos;
    }

    public List<Producto> getProductosByCategoria(String value) {
        List<Producto> productos = new ArrayList<>();

        // Validación del parámetro
        if (value == null || value.trim().isEmpty()) {
            System.out.println("El valor de categoría es nulo o vacío.");
            return productos;
        }

        String sql = "SELECT p.id, p.nombre, p.descripcion, p.precioCompra, p.precioVenta,p.idCategoria, "
                + "c.nombre AS categoria, e.nombre AS estado, pr.empresa AS proveedor, "
                + "p.img, p.fechaCreación, p.fechaModificación "
                + "FROM Productos p "
                + "JOIN Categorias c ON p.idCategoria = c.id "
                + "JOIN EstadosProducto e ON p.idEstado = e.id "
                + "JOIN Proveedores pr ON p.idProveedor = pr.id "
                + "WHERE c.nombre = ? || c.id = ?";

        Conexion c = new Conexion();
        Connection cnx = c.conecta();

        try (PreparedStatement stmt = cnx.prepareStatement(sql)) {
            stmt.setString(1, value);
            stmt.setString(2, value);

            try (ResultSet rs = stmt.executeQuery()) {
                System.out.println(String.format("%-13s %-25s %-15s %-25s", "ID Producto", "Nombre Producto", "ID Categoría", "Nombre Categoría"));
                System.out.println("-----------------------------------------------------------------------");

                while (rs.next()) {
                    Producto producto = new Producto();

                    // Validación antes de asignar valores
                    long idProducto = rs.getLong("id");
                    String nombreProducto = rs.getString("nombre");
                    long idCategoria = rs.getLong("idCategoria");
                    String nombreCategoria = rs.getString("categoria");

                    producto.setId(idProducto);
                    producto.setNombre(nombreProducto);
                    producto.setDescripcion(rs.getString("descripcion"));
                    producto.setPrecioCompra(rs.getDouble("precioCompra"));
                    producto.setPrecioVenta(rs.getDouble("precioVenta"));
                    producto.categoria.setId(idCategoria);
                    producto.categoria.setNombre(nombreCategoria);
                    producto.estado.setNombre(rs.getString("estado"));
                    producto.proveedor.setEmpresa(rs.getString("proveedor"));

                    // Imprimir en consola con formato
                    System.out.println(String.format("%-13d %-25s %-15d %-25s",
                            idProducto,
                            nombreProducto,
                            idCategoria,
                            nombreCategoria));

                    productos.add(producto);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error en obtenerProductoPorCategoria: " + e.getMessage());
        }

        return productos;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public Proveedor getProveedor() {
        return proveedor;
    }

    public void setProveedor(Proveedor proveedor) {
        this.proveedor = proveedor;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getPrecioCompra() {
        return precioCompra;
    }

    public void setPrecioCompra(double precioCompra) {
        this.precioCompra = precioCompra;
    }

    public double getPrecioVenta() {
        return precioVenta;
    }

    public void setPrecioVenta(double precioVenta) {
        this.precioVenta = precioVenta;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public EstadoProducto getEstado() {
        return estado;
    }

    public void setEstado(EstadoProducto estado) {
        this.estado = estado;
    }

}
