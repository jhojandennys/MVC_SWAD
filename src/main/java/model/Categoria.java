package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import utilidades.Conexion;

public class Categoria {

    Long id;
    String nombre;
    String descripcion;

    // Constructor vacío
    public Categoria() {}

    // Método para obtener todas las categorías
    public List<Categoria> getCategories() {
        List<Categoria> lista = new ArrayList<>();
        String query = "SELECT * FROM categorias";

        try (Connection cnx = new Conexion().conecta(); Statement sentencia = cnx.createStatement(); ResultSet resultado = sentencia.executeQuery(query)) {

            while (resultado.next()) {
                Categoria cat = new Categoria();
                cat.setId(resultado.getLong("id"));
                cat.setNombre(resultado.getString("nombre"));
                cat.setDescripcion(resultado.getString("descripcion"));
                lista.add(cat);
            }

        } catch (SQLException e) {
            System.out.println("Error en getCategories: " + e.getMessage());
        }

        return lista;
    }

    // Método para crear una categoría
    public int createCategory(String nombre, String descripcion) {
        if (nombre == null || nombre.isEmpty() || descripcion == null || descripcion.isEmpty()) {
            System.out.println("El nombre o la descripción no pueden estar vacíos.");
            return 0;
        }

        String query = "INSERT INTO categorias (nombre, descripcion) VALUES (?, ?)";

        try (Connection cnx = new Conexion().conecta();
             PreparedStatement sentencia = cnx.prepareStatement(query)) {

            sentencia.setString(1, nombre);
            sentencia.setString(2, descripcion);
            int filasInsertadas = sentencia.executeUpdate();

            return filasInsertadas > 0 ? 1 : 0;

        } catch (SQLException e) {
            System.out.println("Error en createCategory: " + e.getMessage());
            return 0;
        }
    }

    // Método para editar una categoría
    public int editCategory(Long id, String nombre, String descripcion) {
        if (nombre == null || nombre.isEmpty() || descripcion == null || descripcion.isEmpty()) {
            System.out.println("El nombre o la descripción no pueden estar vacíos.");
            return 0;
        }

        String query = "UPDATE categorias SET nombre=?, descripcion=? WHERE id=?";

        try (Connection cnx = new Conexion().conecta();
             PreparedStatement sentencia = cnx.prepareStatement(query)) {

            sentencia.setString(1, nombre);
            sentencia.setString(2, descripcion);
            sentencia.setLong(3, id);
            int filasActualizadas = sentencia.executeUpdate();

            return filasActualizadas > 0 ? 1 : 0;

        } catch (SQLException e) {
            System.out.println("Error en editCategory: " + e.getMessage());
            return 0;
        }
    }

    // Método para eliminar una categoría
    public int deleteCategory(Long id) {
        String query = "DELETE FROM categorias WHERE id=?";

        try (Connection cnx = new Conexion().conecta();
             PreparedStatement sentencia = cnx.prepareStatement(query)) {

            sentencia.setLong(1, id);
            int filasEliminadas = sentencia.executeUpdate();

            return filasEliminadas > 0 ? 1 : 0;

        } catch (SQLException e) {
            System.out.println("Error en deleteCategory: " + e.getMessage());
            return 0;
        }
    }

    // Método para obtener una categoría por su ID
    public Categoria getCategoryById(Long id) {
        String query = "SELECT * FROM categorias WHERE id=?";
        Categoria cat = null;

        try (Connection cnx = new Conexion().conecta();
             PreparedStatement sentencia = cnx.prepareStatement(query)) {

            sentencia.setLong(1, id);
            try (ResultSet resultado = sentencia.executeQuery()) {
                if (resultado.next()) {
                    cat = new Categoria();
                    cat.setId(resultado.getLong("id"));
                    cat.setNombre(resultado.getString("nombre"));
                    cat.setDescripcion(resultado.getString("descripcion"));
                }
            }

        } catch (SQLException e) {
            System.out.println("Error en getCategoryById: " + e.getMessage());
        }

        return cat;
    }

    // Getters y setters
    public Long getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}
