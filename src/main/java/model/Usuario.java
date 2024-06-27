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
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import utilidades.Conexion;

/**
 *
 * @author Estudiante
 */
public class Usuario {

    private Long id;

    private String dni;

    private String nombre;

    private Date fechaNac;

    private String telefono;

    private String correo;

    private String password;

    private String apellidoMat;

    private String apellidoPat;

    private byte[] foto;

    private String rol;

    public Usuario() {
    }

    public int authenticate(String correo, String psw) {
        int logueado;
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            int cont = 0;
            String query = "select * from usuarios ";
            query += "where correo='" + correo + "' and ";
            query += "password='" + psw + "'";
            Statement sentencia = cnx.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            while (resultado.next()) {
                cont++;
            }
            if (cont != 0) {
                logueado = 1;
            } else {
                logueado = 0;
            }
            return logueado;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return -666;
    }

    public void createUser(String cliente_id, String cliente_password,
            String cliente_nombre, String cliente_direccion,
            int cliente_telefono) {
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            // int cnt = Integer.parseInt(cantidad);
            // double mnt = Double.parseDouble(monto);
            String query = "insert into cliente values(?,?,?,?,?)";
            PreparedStatement sentencia = cnx.prepareStatement(query);
            sentencia.setString(1, cliente_id);
            sentencia.setString(2, cliente_password);
            sentencia.setString(3, cliente_nombre);
            sentencia.setString(4, cliente_direccion);
            sentencia.setInt(5, cliente_telefono);

            sentencia.executeUpdate();
            sentencia.close();
            cnx.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void updateUserById(String cliente_id, String cliente_password,
            String cliente_nombre, String cliente_direccion,
            int cliente_telefono) {
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            // int cnt = Integer.parseInt(cantidad);
            // double mnt = Double.parseDouble(monto);
            String query = "update cliente set cliente_password=?, "
                    + "cliente_nombre=?, cliente_direccion=?,"
                    + "cliente_telefono=? where cliente_id = ?);";
            PreparedStatement sentencia = cnx.prepareStatement(query);

            sentencia.setString(1, cliente_password);
            sentencia.setString(2, cliente_nombre);
            sentencia.setString(3, cliente_direccion);
            sentencia.setInt(4, cliente_telefono);
            sentencia.setString(5, cliente_id);

            sentencia.executeUpdate();
            sentencia.close();
            cnx.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void deleteUserById(String cliente_id) {
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            // int cnt = Integer.parseInt(cantidad);
            // double mnt = Double.parseDouble(monto);
            String query = "delete from cliente where cliente_id = ?);";
            PreparedStatement sentencia = cnx.prepareStatement(query);

            sentencia.setString(1, cliente_id);

            sentencia.executeUpdate();
            sentencia.close();
            cnx.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void getUserById(String cliente_id) {
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "select * from cliente where cliente_id=" + cliente_id + ";";
            Statement sentencia = cnx.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);

            resultado.next();
            cliente_id = resultado.getString("cliente_id");
            password = resultado.getString("cliente_password");
            nombre = resultado.getString("cliente_nombre");
            correo = resultado.getString("cliente_direccion");
            telefono = resultado.getString("cliente_telefono");

            sentencia.close();
            cnx.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public List<Usuario> getUsers() {
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "select * from usuarios;";
            List<Usuario> lista = new LinkedList<>();
            Statement sentencia = cnx.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);

            while (resultado.next()) {
                Usuario usr = new Usuario();
                usr.id = resultado.getLong("id");
                usr.password = resultado.getString("password");
                usr.nombre = resultado.getString("nombre");
                usr.apellidoMat = resultado.getString("apellidomat");
                usr.apellidoPat = resultado.getString("apellidopat");
                usr.correo = resultado.getString("correo");
                usr.telefono = resultado.getString("telefono");
                lista.add(usr);
            }
            sentencia.close();
            cnx.close();
            return lista;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return null;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Date getFechaNac() {
        return fechaNac;
    }

    public void setFechaNac(Date fechaNac) {
        this.fechaNac = fechaNac;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getApellidoMat() {
        return apellidoMat;
    }

    public void setApellidoMat(String apellidoMat) {
        this.apellidoMat = apellidoMat;
    }

    public String getApellidoPat() {
        return apellidoPat;
    }

    public void setApellidoPat(String apellidoPat) {
        this.apellidoPat = apellidoPat;
    }

    public byte[] getFoto() {
        return foto;
    }

    public void setFoto(byte[] foto) {
        this.foto = foto;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

}
