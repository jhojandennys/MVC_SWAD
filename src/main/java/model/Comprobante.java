/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import utilidades.Conexion;

/**
 *
 * @author GianN
 */
public class Comprobante {

    private TipoComprobante tipo;
    private Long id;
    private double monto;
    private Date fecha;
    private Time hora;

    public Comprobante() {
    }

    public Comprobante getComprobanteById(String id) {
        Comprobante com = null;  // Inicializa como null para manejar el caso de que no se encuentre ningún rol
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "SELECT \n"
                    + "    c.id AS comprobante_id,\n"
                    + "    c.monto,\n"
                    + "    c.fecha,\n"
                    + "    c.hora,\n"
                    + "    tc.id AS tipoComprobante_id,\n"
                    + "    tc.nombre AS tp_nombre,\n"
                    + "    tc.descripcion AS tp_descripcion\n"
                    + "FROM \n"
                    + "    BDCamas.Comprobante c\n"
                    + "JOIN \n"
                    + "    BDCamas.TipoComprobante tc ON c.idTipoComprobante = tc.id\n"
                    + "WHERE \n"
                    + "    c.id = ?; ";
            PreparedStatement sentencia = cnx.prepareStatement(query);
            sentencia.setString(1, id);
            ResultSet resultado = sentencia.executeQuery();

            if (resultado.next()) {
                com = new Comprobante();
                com.setId(resultado.getLong("id"));
                com.setMonto(resultado.getDouble("monto"));
                com.setFecha(resultado.getDate("fecha"));
                com.setHora(resultado.getTime("hora"));
                TipoComprobante tp = new TipoComprobante();
                tp.setId(resultado.getLong("tipoComprobante_id"));
                tp.setNombre(resultado.getString("tp_nombre"));
                tp.setDescripcion(resultado.getString("tp_descripcion"));
                com.setTipo(tp);
            }

            resultado.close();
            sentencia.close();
            cnx.close();
        } catch (SQLException e) {
            System.out.println("Error en getComprobanteById: " + e.getMessage());
        }
        return com;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Time getHora() {
        return hora;
    }

    public void setHora(Time hora) {
        this.hora = hora;
    }

    public TipoComprobante getTipo() {
        return tipo;
    }

    public void setTipo(TipoComprobante tipo) {
        this.tipo = tipo;
    }

}
