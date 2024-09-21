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
public class EstadosCita {

    private Long id;
    private String nombre;
    private String descripcion;

    public EstadosCita() {

    }

    public List<EstadosCita> getEstados() {
        List<EstadosCita> lista = new ArrayList<>();
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "SELECT * FROM estadoscita";
            Statement sentencia = cnx.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);

            while (resultado.next()) {
                EstadosCita ec = new EstadosCita();
                ec.setId(resultado.getLong("id"));
                ec.setNombre(resultado.getString("nombre"));
                ec.setDescripcion(resultado.getString("descripcion"));
                lista.add(ec);
            }
            resultado.close();
            sentencia.close();
            cnx.close();
        } catch (SQLException e) {
            System.out.println("Error en getCita: " + e.getMessage());
        }
        return lista;
    }

    public EstadosCita getDatosById(Long id) {
        EstadosCita enc = new EstadosCita();
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "SELECT * FROM estadoscita where id=?";
            PreparedStatement sentencia = cnx.prepareCall(query);
            sentencia.setLong(1, id);
            ResultSet resultado = sentencia.executeQuery();
            while (resultado.next()) {
                EstadosCita ec = new EstadosCita();
                ec.setId(resultado.getLong("id"));
                ec.setNombre(resultado.getString("nombre"));
                ec.setDescripcion(resultado.getString("descripcion"));
                enc = ec;
            }
            resultado.close();
            sentencia.close();
            cnx.close();
        } catch (SQLException e) {
            System.out.println("Error en getCita: " + e.getMessage());
        }
        return enc;
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

}
