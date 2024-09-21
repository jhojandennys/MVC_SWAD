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
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import utilidades.Conexion;

/**
 *
 * @author GianN
 */
public class Compra {

    private Long id;
    private Date fecha;
    private Double total;
    private Usuario comprador;
    private EstadoCompra estado;
    private Proveedor proveedor;
    private Time hora;
    private Comprobante comprobante;

    public Compra() {
    }

    public List<Compra> getCompras() {
        List<Compra> list = new ArrayList<Compra>();
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "SELECT \n"
                    + "    co.id AS idCompra,\n"
                    + "    co.fecha AS fechaCompra,\n"
                    + "    co.horaCompra,\n"
                    + "    co.total AS totalCompra,\n"
                    + "    p.id AS idProveedor,\n"
                    + "    p.empresa,\n"
                    + "    p.telefono as telefonoProveedor,\n"
                    + "    p.direccion AS direccionProveedor,\n"
                    + "    p.correo AS correoProveedor,\n"
                    + "    p.ruc,\n"
                    + "    e.id AS idEmpleado,\n"
                    + "    e.nombres AS nombresEmpleado,\n"
                    + "    e.apePaterno AS apePaternoEmpleado,\n"
                    + "    e.apeMaterno AS apeMaternoEmpleado,\n"
                    + "    e.dni AS dniEmpleado,\n"
                    + "    e.telefono AS telefonoEmpleado,\n"
                    + "    e.correo AS correoEmpleado,\n"
                    + "    comp.id AS idComprobante,\n"
                    + "    comp.monto AS montoComprobante,\n"
                    + "    comp.fecha AS fechaComprobante,\n"
                    + "    tc.id AS tipoComprobanteID,\n"
                    + "    tc.nombre AS tipoComprobante\n"
                    + "\n"
                    + "FROM \n"
                    + "    Compras co\n"
                    + "JOIN \n"
                    + "    Proveedores p ON co.idProveedor = p.id\n"
                    + "JOIN \n"
                    + "    Empleados e ON co.idEmpleado = e.id\n"
                    + "LEFT JOIN \n"
                    + "    Comprobante comp ON co.idComprobante = comp.id\n"
                    + "LEFT JOIN \n"
                    + "    TipoComprobante tc ON comp.idTipoComprobante = tc.id;";
            Statement sentencia = cnx.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);

            while (resultado.next()) {
                Compra co = new Compra();
                co.setId(resultado.getLong("idCompra"));
                co.setFecha(resultado.getDate("fechaCompra"));
                co.setHora(resultado.getTime("horaCompra"));
                co.setTotal(resultado.getDouble("totalCompra"));
                Proveedor pv = new Proveedor();
                pv.setId(resultado.getLong("idProveedor"));
                pv.setEmpresa(resultado.getString("empresa"));
                pv.setRuc(resultado.getString("ruc"));
                pv.setCorreo(resultado.getString("correoProveedor"));
                pv.setTelefono(resultado.getString("telefonoProveedor"));
                pv.setDireccion(resultado.getString("direccionProveedor"));
                co.setProveedor(pv);

                Usuario emp = new Usuario();
                emp.setId(resultado.getLong("idEmpleado"));
                emp.setDni(resultado.getString("dniEmpleado"));
                emp.setNombres(resultado.getString("nombresEmpleado"));
                emp.setApePaterno(resultado.getString("apePaternoEmpleado"));
                emp.setApeMaterno(resultado.getString("apeMaternoEmpleado"));
                emp.setTelefono(resultado.getString("telefonoEmpleado"));
                emp.setCorreo(resultado.getString("correoEmpleado"));
                co.setComprador(emp);
                TipoComprobante tc = new TipoComprobante();
                tc.setId(resultado.getLong("tipoComprobanteID"));
                tc.setNombre(resultado.getString("tipoComprobante"));

                Comprobante com = new Comprobante();
                com.setId(resultado.getLong("idComprobante"));
                com.setTipo(tc);
                co.setComprobante(com);

                list.add(co);
            }
            resultado.close();
            sentencia.close();
            cnx.close();
        } catch (SQLException e) {
            System.out.println("Error en getVentas: " + e.getMessage());
        }
        return list;

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public Usuario getComprador() {
        return comprador;
    }

    public void setComprador(Usuario comprador) {
        this.comprador = comprador;
    }

    public EstadoCompra getEstado() {
        return estado;
    }

    public void setEstado(EstadoCompra estado) {
        this.estado = estado;
    }

    public Proveedor getProveedor() {
        return proveedor;
    }

    public void setProveedor(Proveedor proveedor) {
        this.proveedor = proveedor;
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
