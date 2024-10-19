/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Cliente;
import utilidades.Conexion;

public class ClienteDAO {

    public ClienteDAO() {

    }

    public int createCliente(String cl_nombre, String cl_paterno,
            String cl_materno, String cl_telf, String cl_direc, String cl_dni) {
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();

            String query = "INSERT INTO clientes (nombres, apePaterno, apeMaterno, telefono, correo, dni,usuarioCreador,usuarioModificador) VALUES (?, ?, ?, ?, ?, ?,?,?)";
            PreparedStatement sentencia = cnx.prepareStatement(query);
            sentencia.setString(1, cl_nombre);
            sentencia.setString(2, cl_paterno);
            sentencia.setString(3, cl_materno);
            sentencia.setString(4, cl_telf);
            sentencia.setString(5, cl_direc);
            sentencia.setString(6, cl_dni);
            sentencia.setString(7, "1");
            sentencia.setString(8, "1");

            int filasInsertadas = sentencia.executeUpdate();

            sentencia.close();
            cnx.close();

            return filasInsertadas > 0 ? 1 : 0;
        } catch (SQLException e) {
            System.out.println("Error en createCliente: " + e.getMessage());
            return 0;
        }
    }

    public int editCliente(String id, String cl_nombre, String cl_paterno,
            String cl_materno, String cl_telf, String cl_direc, String cl_dni) {
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();

            String query = "UPDATE clientes set nombres=?, apePaterno=?, apeMaterno=?, telefono=?, correo=?, dni=? ,usuarioCreador='1',usuarioModificador='2' WHERE id=?";
            PreparedStatement sentencia = cnx.prepareStatement(query);

            sentencia.setString(1, cl_nombre);
            sentencia.setString(2, cl_paterno);
            sentencia.setString(3, cl_materno);
            sentencia.setString(4, cl_telf);
            sentencia.setString(5, cl_direc);
            sentencia.setString(6, cl_dni);
            sentencia.setString(7, id);

            int filasActualizadas = sentencia.executeUpdate();

            sentencia.close();
            cnx.close();

            return filasActualizadas > 0 ? 1 : 0;
        } catch (SQLException e) {
            System.out.println("Error en editCliente: " + e.getMessage());
            return 0;
        }
    }

    public int deleteCliente(String id) {
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();

            String query = "DELETE FROM clientes WHERE id=?";
            PreparedStatement sentencia = cnx.prepareStatement(query);
            sentencia.setString(1, id);

            int filasEliminadas = sentencia.executeUpdate();

            sentencia.close();
            cnx.close();

            return filasEliminadas > 0 ? 1 : 0;
        } catch (SQLException e) {
            System.out.println("Error en deleteCliente: " + e.getMessage());
            return 0;
        }
    }

    public Cliente getClienteById(String id) {
        Cliente cl = new Cliente();
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "SELECT * FROM BDCamas.Clientes WHERE id=?";
            PreparedStatement sentencia = cnx.prepareStatement(query);
            sentencia.setString(1, id);
            ResultSet resultado = sentencia.executeQuery();

            while (resultado.next()) {
                cl.setId(resultado.getLong("id"));
                cl.setNombre(resultado.getString("nombres"));
                cl.setApellPaterno(resultado.getString("apePaterno"));
                cl.setApellMaterno(resultado.getString("apeMaterno"));
                cl.setCorreo(resultado.getString("correo"));
                cl.setTelefono(resultado.getString("telefono"));
                cl.setDni(resultado.getString("dni"));
            }
            resultado.close();
            sentencia.close();
            cnx.close();
            return cl;
        } catch (SQLException e) {
            System.out.println("Error en getClienteById: " + e.getMessage());
        }

        return cl;
    }

    public List<Cliente> getClientes() {
        List<Cliente> lista = new ArrayList<>();
        try {
            Connection cnx = Conexion.conecta();
            String query = "SELECT * FROM BDCamas.Clientes";
            Statement sentencia = cnx.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);

            while (resultado.next()) {
                Cliente cl = new Cliente();
                cl.setId(resultado.getLong("id"));
                cl.setNombre(resultado.getString("nombres"));
                cl.setApellPaterno(resultado.getString("apePaterno"));
                cl.setApellMaterno(resultado.getString("apeMaterno"));
                cl.setDni(resultado.getString("dni"));
                cl.setTelefono(resultado.getString("telefono"));
                cl.setCorreo(resultado.getString("correo"));
                lista.add(cl);
            }
            resultado.close();
            sentencia.close();
            cnx.close();
        } catch (SQLException e) {
            System.out.println("Error en getClientes: " + e.getMessage());
        }

        return lista;
    }

}
