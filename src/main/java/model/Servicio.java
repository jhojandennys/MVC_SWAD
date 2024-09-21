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
 * @author GianN
 */
public class Servicio {

    private Long id;

    private String nombre;

    private String descripcion;

    private Double precio;

    public Servicio() {
    }

    public Servicio getDatosById(Long id) {
        Servicio sv = new Servicio();
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "SELECT * FROM servicios "
                    + "WHERE id = ?;";
            PreparedStatement sentencia = cnx.prepareStatement(query);
            sentencia.setLong(1, id);
            ResultSet resultado = sentencia.executeQuery();

            while (resultado.next()) {
                sv.setId(id);
                sv.setNombre(resultado.getString("nombre"));
                sv.setDescripcion(resultado.getString("descripcion"));
                sv.setPrecio(resultado.getDouble("precio"));
            }
            resultado.close();
            sentencia.close();
            cnx.close();
        } catch (SQLException e) {
            System.out.println("Error en getServicioById: " + e.getMessage());
        }

        return sv;
    }

    public List<Servicio> getServicios() {
        List<Servicio> lista = new ArrayList<>();
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "SELECT * FROM servicios";
            Statement sentencia = cnx.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);

            while (resultado.next()) {
                Servicio ct = new Servicio();
                ct.setId(resultado.getLong("id"));
                ct.setNombre(resultado.getString("nombre"));
                ct.setDescripcion(resultado.getString("descripcion"));
                ct.setPrecio(resultado.getDouble("precio"));
                lista.add(ct);
            }
            resultado.close();
            sentencia.close();
            cnx.close();
        } catch (SQLException e) {
            System.out.println("Error en getServicios: " + e.getMessage());
        }
        return lista;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

}
