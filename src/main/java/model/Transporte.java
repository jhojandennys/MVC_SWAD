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
 * @author GianN
 */
public class Transporte {

    private Long id;
    private String placa;
    private String modelo;
    private String marca;
    private String descripcion;

    public Transporte() {
    }

    public List<Transporte> getTransportes() {
        List<Transporte> lista = new ArrayList<>();
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "SELECT * FROM BDCamas.Transporte";
            Statement sentencia = cnx.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);

            while (resultado.next()) {
                Transporte tr = new Transporte();
                tr.setId(resultado.getLong("id"));
                tr.setDescripcion(resultado.getString("descripcion"));
                tr.setMarca(resultado.getString("marca"));
                tr.setModelo(resultado.getString("modelo"));
                tr.setPlaca(resultado.getString("placa"));

                lista.add(tr);
            }

            resultado.close();
            sentencia.close();
            cnx.close();
        } catch (SQLException e) {
            System.out.println("Error en getTransportes: " + e.getMessage());
        }
        return lista;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

}
