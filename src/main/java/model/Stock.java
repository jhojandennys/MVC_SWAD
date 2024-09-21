/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import utilidades.Conexion;

/**
 *
 * @author Chavez
 */
public class Stock {

    private Long id;
    private Producto producto;
    private String ubicacion;
    private int cantidad;

    public Stock() {
    }

    public List<Stock> getStock() {
        List<Stock> lista = new ArrayList<>();
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "SELECT\n"
                    + "  s.id AS stock_id,\n"
                    + "  s.ubicacion,\n"
                    + "  s.cantidad,\n"
                    + "  p.id AS producto_id,\n"
                    + "  p.nombre AS producto_nombre,\n"
                    + "  p.descripcion AS producto_descripcion,\n"
                    + "  p.precioCompra,\n"
                    + "  p.precioVenta,\n"
                    + "  p.idCategoria,\n"
                    + "  p.img,\n"
                    + "  p.idEstado,\n"
                    + "  p.idProveedor\n"
                    + "FROM BDCamas.Stock s\n"
                    + "JOIN BDCamas.Productos p ON s.idProducto = p.id;";
            Statement sentencia = cnx.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);

            while (resultado.next()) {
                Stock st = new Stock();
                st.setId(resultado.getLong("stock_id"));
                st.setUbicacion(resultado.getString("ubicacion"));
                st.setCantidad(resultado.getInt("cantidad"));

                Producto pr = new Producto();
                pr.setId(resultado.getLong("producto_id"));
                pr.setNombre(resultado.getString("producto_nombre"));
                pr.setDescripcion(resultado.getString("producto_descripcion"));
                pr.setPrecioVenta(resultado.getDouble("precioVenta"));
                pr.setPrecioCompra(resultado.getDouble("precioCompra"));
                pr.setImagen(resultado.getString("img"));

                Categoria cat = new Categoria();

                EstadoProducto ep = new EstadoProducto();

                Proveedor pv = new Proveedor();

                
                pr.setCategoria(cat);
                pr.setEstado(ep);
                pr.setProveedor(pv);
                st.setProducto(pr);
                lista.add(st);
            }

            resultado.close();
            sentencia.close();
            cnx.close();
        } catch (SQLException e) {
            System.out.println("Error en getUsers: " + e.getMessage());
        }
        return lista;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

}
