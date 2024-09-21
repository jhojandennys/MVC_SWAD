/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import utilidades.Conexion;

/**
 *
 * @author Estudiante
 */
public class Venta {
    
    private Long id;
    private Cliente cliente;
    private Usuario empleado;
    private Date fecha;
    private double impuesto;
    private double total;
    private double descuento;
    private MetodoPago metodoPago;
    private Time hora;
    private Comprobante comprobante;
    
    public Venta() {
    }
    
    public List<Venta> getVentas() {
        List<Venta> lista = new ArrayList<>();
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "SELECT \n"
                    + "    v.id AS idVenta,\n"
                    + "    v.fecha AS fechaVenta,\n"
                    + "    v.horaVenta AS horaVenta,\n"
                    + "    v.impuesto AS impuestoVenta,\n"
                    + "    v.total AS totalVenta,\n"
                    + "    v.descuento AS descuentoVenta,"
                    + "    c.id AS idCliente,\n"
                    + "    c.nombres AS nombresCliente,\n"
                    + "    c.apePaterno AS apePaternoCliente,\n"
                    + "    c.apeMaterno AS apeMaternoCliente,\n"
                    + "    c.dni AS dniCliente,\n"
                    + "    c.telefono AS telefonoCliente,\n"
                    + "    c.correo AS correoCliente,\n"
                    + "    e.id AS idEmpleado,\n"
                    + "    e.nombres AS nombresEmpleado,\n"
                    + "    e.apePaterno AS apePaternoEmpleado,\n"
                    + "    e.apeMaterno AS apeMaternoEmpleado,\n"
                    + "    e.dni AS dniEmpleado,\n"
                    + "    e.telefono AS telefonoEmpleado,\n"
                    + "    e.correo AS correoEmpleado,\n"
                    + "    mp.nombre AS nombreMetodoPago,"
                    + "    mp.id as idMetodoPago,\n"
                    + "    mp.descripcion AS descripcionMetodoPago,\n"
                    + "    comp.id AS idComprobante,\n"
                    + "    comp.monto AS montoComprobante,\n"
                    + "    comp.fecha AS fechaComprobante,\n"
                    + "    tc.nombre AS tipoComprobante\n"
                    + "\n"
                    + "FROM \n"
                    + "    Ventas v\n"
                    + "JOIN \n"
                    + "    Clientes c ON v.idCliente = c.id\n"
                    + "JOIN \n"
                    + "    Empleados e ON v.idEmpleado = e.id\n"
                    + "JOIN \n"
                    + "    MetodoPago mp ON v.idMetodoPago = mp.id\n"
                    + "LEFT JOIN \n"
                    + "    Comprobante comp ON v.idComprobante = comp.id\n"
                    + "LEFT JOIN \n"
                    + "    TipoComprobante tc ON comp.idTipoComprobante = tc.id;";
            Statement sentencia = cnx.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            
            while (resultado.next()) {
                Venta vt = new Venta();
                vt.setId(resultado.getLong("idVenta"));
                vt.setFecha(resultado.getDate("fechaVenta"));
                vt.setHora(resultado.getTime("horaVenta"));
                vt.setImpuesto(resultado.getDouble("impuestoVenta"));
                vt.setTotal(resultado.getDouble("totalVenta"));
                vt.setDescuento(resultado.getDouble("descuentoVenta"));
                Cliente cl = new Cliente();
                cl.setId(resultado.getLong("idCliente"));
                cl.setNombre(resultado.getString("nombresCliente"));
                cl.setApellPaterno(resultado.getString("apePaternoCliente"));
                cl.setApellMaterno(resultado.getString("apeMaternoCliente"));
                cl.setCorreo(resultado.getString("correoCliente"));
                cl.setTelefono(resultado.getString("telefonoCliente"));
                cl.setDni(resultado.getString("dniCliente"));
                vt.setCliente(cl);
                
                Usuario emp = new Usuario();
                emp.setId(resultado.getLong("idEmpleado"));
                emp.setDni(resultado.getString("dniEmpleado"));
                emp.setNombres(resultado.getString("nombresEmpleado"));
                emp.setApePaterno(resultado.getString("apePaternoEmpleado"));
                emp.setApeMaterno(resultado.getString("apeMaternoEmpleado"));
                emp.setTelefono(resultado.getString("telefonoEmpleado"));
                emp.setCorreo(resultado.getString("correoEmpleado"));
                vt.setEmpleado(emp);
                
                MetodoPago mp = new MetodoPago();
                mp.setId(resultado.getLong("idMetodoPago"));
                mp.setNombre(resultado.getString("nombreMetodoPago"));
                mp.setDescripcion(resultado.getString("descripcionMetodoPago"));
                vt.setMetodoPago(mp);
                
                Comprobante com = new Comprobante();
                com.setId(resultado.getLong("idComprobante"));
                vt.setComprobante(com);
                
                lista.add(vt);
            }
            resultado.close();
            sentencia.close();
            cnx.close();
        } catch (SQLException e) {
            System.out.println("Error en getVentas: " + e.getMessage());
        }
        return lista;
    }
    
    public double getImpuesto() {
        return impuesto;
    }
    
    public void setImpuesto(double impuesto) {
        this.impuesto = impuesto;
    }
    
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public Cliente getCliente() {
        return cliente;
    }
    
    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    
    public Usuario getEmpleado() {
        return empleado;
    }
    
    public void setEmpleado(Usuario empleado) {
        this.empleado = empleado;
    }
    
    public Date getFecha() {
        return fecha;
    }
    
    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
    
    public double getTotal() {
        return total;
    }
    
    public void setTotal(double total) {
        this.total = total;
    }
    
    public double getDescuento() {
        return descuento;
    }
    
    public void setDescuento(double descuento) {
        this.descuento = descuento;
    }
    
    public MetodoPago getMetodoPago() {
        return metodoPago;
    }
    
    public void setMetodoPago(MetodoPago metodoPago) {
        this.metodoPago = metodoPago;
    }
    
    public Time getHora() {
        return hora;
    }
    
    public void setHora(Time hora) {
        this.hora = hora;
    }
    
    public Comprobante getComprobante() {
        return comprobante;
    }
    
    public void setComprobante(Comprobante comprobante) {
        this.comprobante = comprobante;
    }
    
}
