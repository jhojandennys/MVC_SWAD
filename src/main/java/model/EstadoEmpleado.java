/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utilidades.Conexion;

/**
 *
 * @author GianN
 */
public class EstadoEmpleado {

    private Long id;
    private String nombre;
    private String descripcion;

    public EstadoEmpleado() {
    }

    public EstadoEmpleado getEstadoEmpleadoById(Long id) {
        EstadoEmpleado es = null;  // Inicializa como null para manejar el caso de que no se encuentre ningún rol

        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "SELECT * FROM EstadosEmpleado WHERE id=?";
            PreparedStatement sentencia = cnx.prepareStatement(query);
            sentencia.setLong(1, id);
            ResultSet resultado = sentencia.executeQuery();

            if (resultado.next()) {
                EstadoEmpleado estado = new EstadoEmpleado();
                es.setId(resultado.getLong("id"));
                es.setNombre(resultado.getString("nombre"));
                es.setDescripcion(resultado.getString("descripcion"));
                es = estado;  // Asigna el rol encontrado a rl
            }

            resultado.close();
            sentencia.close();
            cnx.close();
        } catch (SQLException e) {
            System.out.println("Error en getEstadoEmpleadoById: " + e.getMessage());
        }

        return es;
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
