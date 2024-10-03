package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;
import model.EstadoEmpleado;
import model.Rol;
import model.Usuario;
import org.mindrot.jbcrypt.BCrypt;
import utilidades.Conexion;

public class UsuarioDAO {

    public UsuarioDAO() {
    }

    
    public Usuario authenticate(String email, String psw, String ipCliente) {
        Usuario logueado = new Usuario();
        Rol rolN = new Rol();
        String emailRegex = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
        String passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";

        // Validación del formato del correo electrónico
        if (!Pattern.matches(emailRegex, email)) {
            System.out.println("Correo electrónico no válido.");
            rolN.setId(Long.valueOf("-1"));
            logueado.setRol(rolN);
            return logueado;
        }

        // Validación del formato de la contraseña
        if (!Pattern.matches(passwordRegex, psw)) {
            System.out.println("Contraseña no válida.");
            rolN.setId(Long.valueOf("-2"));
            logueado.setRol(rolN);
            return logueado;
        }

        try {
            Connection cnx = Conexion.conecta();

            // Verificamos si el correo está registrado
            String queryEmail = "SELECT e.*, r.nombre as nombreRol FROM Empleados e INNER JOIN Roles r on e.idRol = r.id WHERE e.correo = ?";
            PreparedStatement sentenciaEmail = cnx.prepareStatement(queryEmail);
            sentenciaEmail.setString(1, email);
            ResultSet resultadoEmail = sentenciaEmail.executeQuery();

            if (!resultadoEmail.next()) {
                // Si el correo no está registrado, devolvemos -1
                rolN.setId(Long.valueOf("-1"));
                logueado.setRol(rolN);
                System.out.println("Correo no registrado.");
                resultadoEmail.close();
                sentenciaEmail.close();
                cnx.close();
                return logueado;
            }

            // Si el correo está registrado, obtenemos el hash de la contraseña
            String hashPassword = resultadoEmail.getString("contra");

            // Verificamos la contraseña
            if (BCrypt.checkpw(psw, hashPassword)) {
                // Si la contraseña es correcta, devolvemos los datos del usuario
                logueado.setId(resultadoEmail.getLong("id"));
                rolN.setId(Long.valueOf(resultadoEmail.getString("idRol")));
                System.out.println("Usuario autenticado correctamente: " + email);
                String insertSession = "INSERT INTO HistorialSesion (idEmpleado, ip, usuarioCreador, usuarioModificador) VALUES (?, ?, ?, ?)";
                PreparedStatement sentenciaSession = cnx.prepareStatement(insertSession);
                sentenciaSession.setLong(1, logueado.getId());
                sentenciaSession.setString(2, ipCliente); // IP del cliente
                sentenciaSession.setLong(3, logueado.getId());
                sentenciaSession.setLong(4, logueado.getId());
                sentenciaSession.executeUpdate();
                sentenciaSession.close();
            } else {
                // Si la contraseña es incorrecta, devolvemos -2
                rolN.setId(Long.valueOf("-2"));
                System.out.println("Contraseña incorrecta.");
            }
            System.out.println("ROLN " + rolN.getId());

            logueado.setRol(rolN);
            resultadoEmail.close();
            sentenciaEmail.close();
            cnx.close();

            return logueado;
        } catch (SQLException e) {
            System.out.println("Error en authenticate: " + e.getMessage());
            return logueado;
        }
    }

    public int createUser(String dni, String nombres, String correo, String contra,
            String apePaterno, String apeMaterno, String telefono, int idRol,
            int usuCreador
    ) {
        // Verificar que los campos no sean vacíos
        if (dni == null || dni.trim().isEmpty()
                || nombres == null || nombres.trim().isEmpty()
                || correo == null || correo.trim().isEmpty()
                || contra == null || contra.trim().isEmpty()
                || apePaterno == null || apePaterno.trim().isEmpty()
                || apeMaterno == null || apeMaterno.trim().isEmpty()
                || telefono == null || telefono.trim().isEmpty()) {
            System.out.println("Error: Todos los campos deben ser completados.");
            return 0;
        }

        // Verificar que el DNI tenga exactamente 8 dígitos
        if (dni.length() != 8 || !dni.matches("\\d{8}")) {
            System.out.println("Error: El DNI debe tener exactamente 8 dígitos.");
            return 0;
        }

        // Validar el correo
        String emailRegex = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
        if (!Pattern.matches(emailRegex, correo)) {
            System.out.println("Error: Correo electrónico no válido.");
            return 0;
        }

        // Validar la contraseña
        String passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";
        if (!Pattern.matches(passwordRegex, contra)) {
            System.out.println("Error: La contraseña debe tener al menos 8 caracteres, incluyendo al menos una letra mayúscula, una letra minúscula, un número y un carácter especial.");
            return 0;
        }

        // Validar el teléfono (9 dígitos)
        if (telefono.length() != 9 || !telefono.matches("\\d{9}")) {
            System.out.println("Error: El teléfono debe tener exactamente 9 dígitos.");
            return 0;
        }
        String hashedPassword = BCrypt.hashpw(contra, BCrypt.gensalt());
        System.out.println("HASHEED :" + hashedPassword);
        Connection cnx = null;
        PreparedStatement insertStmt = null;
        PreparedStatement selectStmt = null;
        ResultSet rs = null;
        int filasInsertadas = 0;

        try {
            Conexion c = new Conexion();
            cnx = c.conecta();

            // Prepara la consulta de inserción
            String insertQuery = "INSERT INTO empleados (nombres, apePaterno, apeMaterno, correo, contra, telefono, idRol, idEstado, dni, usuarioCreador, usuarioModificador) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            insertStmt = cnx.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            insertStmt.setString(1, nombres);
            insertStmt.setString(2, apePaterno);
            insertStmt.setString(3, apeMaterno);
            insertStmt.setString(4, correo);
            insertStmt.setString(5, hashedPassword);
            insertStmt.setString(6, telefono);
            insertStmt.setInt(7, idRol);
            insertStmt.setInt(8, 1); // idEstado, asumido como valor constante
            insertStmt.setString(9, dni);
            insertStmt.setInt(10, usuCreador);
            insertStmt.setInt(11, usuCreador);

            filasInsertadas = insertStmt.executeUpdate();

            if (filasInsertadas > 0) {
                // Obtener el ID del nuevo registro
                rs = insertStmt.getGeneratedKeys();
                if (rs.next()) {
                    int nuevoId = rs.getInt(1);

                    // Consultar el registro recién creado
                    String selectQuery = "SELECT * FROM empleados WHERE id=?";
                    selectStmt = cnx.prepareStatement(selectQuery);
                    selectStmt.setInt(1, nuevoId);
                    ResultSet rsSelect = selectStmt.executeQuery();

                    if (rsSelect.next()) {
                        // Mostrar el registro creado
                        System.out.println("Usuario Creado Correctamente:");
                        System.out.println("ID: " + rsSelect.getInt("id"));
                        System.out.println("DNI: " + rsSelect.getString("dni"));
                        System.out.println("Nombres: " + rsSelect.getString("nombres"));
                        System.out.println("Correo: " + rsSelect.getString("correo"));
                        System.out.println("Contraseña: " + rsSelect.getString("contra"));
                        System.out.println("Apellido Paterno: " + rsSelect.getString("apePaterno"));
                        System.out.println("Apellido Materno: " + rsSelect.getString("apeMaterno"));
                        System.out.println("Teléfono: " + rsSelect.getString("telefono"));
                        System.out.println("ID Rol: " + rsSelect.getInt("idRol"));
                        System.out.println("ID Estado: " + rsSelect.getInt("idEstado"));
                        System.out.println("Usuario Creador: " + rsSelect.getInt("usuarioCreador"));
                        System.out.println("Usuario Modificador: " + rsSelect.getInt("usuarioModificador"));
                    } else {
                        System.out.println("No se pudo recuperar el usuario recién creado.");
                    }
                    rsSelect.close();
                }
            } else {
                System.out.println("No se pudo crear el usuario.");
            }
        } catch (SQLException e) {
            System.out.println("Error en crearUsuario: " + e.getMessage());
            return 0;
        } finally {
            // Cierra los recursos en el bloque finally
            try {
                if (insertStmt != null) {
                    insertStmt.close();
                }
                if (selectStmt != null) {
                    selectStmt.close();
                }
                if (rs != null) {
                    rs.close();
                }
                if (cnx != null) {
                    cnx.close();
                }
            } catch (SQLException e) {
                System.out.println("Error al cerrar recursos: " + e.getMessage());
            }
        }

        return filasInsertadas;
    }

    public int editUser(int id, String dni, String nombres, String correo, String contra,
            String apePaterno, String apeMaterno, String telefono, int idRol, int idEstado) {
        // Validación de campos
        if (dni == null || dni.trim().isEmpty() || dni.length() != 8) {
            System.out.println("El DNI debe tener exactamente 8 dígitos.");
            return 0;
        }
        if (nombres == null || nombres.trim().isEmpty()) {
            System.out.println("El nombre no debe estar vacío.");
            return 0;
        }
        if (correo == null || correo.trim().isEmpty() || !correo.matches("^[\\w-.]+@[\\w-]+\\.[a-zA-Z]{2,}$")) {
            System.out.println("El correo no debe estar vacío y debe ser un correo válido.");
            return 0;
        }
        if (contra == null || contra.trim().isEmpty() || !contra.matches("(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*()_+]).{8,}")) {
            System.out.println("La contraseña debe tener al menos 8 caracteres, una mayúscula, un número y un carácter especial.");
            return 0;
        }
        if (apePaterno == null || apePaterno.trim().isEmpty()) {
            System.out.println("El apellido paterno no debe estar vacío.");
            return 0;
        }
        if (apeMaterno == null || apeMaterno.trim().isEmpty()) {
            System.out.println("El apellido materno no debe estar vacío.");
            return 0;
        }
        if (telefono == null || telefono.trim().isEmpty() || !telefono.matches("\\d{9}")) {
            System.out.println("El teléfono debe tener exactamente 9 dígitos.");
            return 0;
        }

        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();

            // Prepara la consulta de actualización
            String query = "UPDATE empleados SET dni=?, nombres=?, correo=?, contra=?, "
                    + "apePaterno=?, apeMaterno=?, idEstado=?, idRol=?, telefono=? WHERE id=?";
            PreparedStatement sentencia = cnx.prepareStatement(query);
            sentencia.setString(1, dni);
            sentencia.setString(2, nombres);
            sentencia.setString(3, correo);
            sentencia.setString(4, contra);
            sentencia.setString(5, apePaterno);
            sentencia.setString(6, apeMaterno);
            sentencia.setInt(7, idEstado);
            sentencia.setInt(8, idRol);
            sentencia.setString(9, telefono);
            sentencia.setInt(10, id);

            int filasActualizadas = sentencia.executeUpdate();

            if (filasActualizadas > 0) {
                // Imprime los cambios realizados
                System.out.println("Registro modificado correctamente.");
                System.out.println("Cambios realizados:");
                System.out.println("ID: " + id);
                System.out.println("DNI: " + dni);
                System.out.println("Nombres: " + nombres);
                System.out.println("Correo: " + correo);
                System.out.println("Contraseña: " + contra);
                System.out.println("Apellido Paterno: " + apePaterno);
                System.out.println("Apellido Materno: " + apeMaterno);
                System.out.println("Teléfono: " + telefono);
                System.out.println("ID Rol: " + idRol);
                System.out.println("ID Estado: " + idEstado);
            } else {
                System.out.println("No se encontró el usuario con el ID proporcionado o no se realizaron cambios.");
            }
            sentencia.close();
            cnx.close();

            return filasActualizadas > 0 ? 1 : 0;
        } catch (SQLException e) {
            System.out.println("Error en editUser: " + e.getMessage());
            return 0;
        }
    }

    public int deleteUser(String id) {
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();

            String query = "DELETE FROM empleados WHERE id=?";
            PreparedStatement sentencia = cnx.prepareStatement(query);
            sentencia.setString(1, id);

            int filasEliminadas = sentencia.executeUpdate();

            sentencia.close();
            cnx.close();

            return filasEliminadas;
        } catch (SQLException e) {
            System.out.println("Error en deleteUser: " + e.getMessage());
            return 0;
        }
    }

    public Usuario getUserByDni(String dni) {
        Usuario usr = new Usuario();
        if (dni.length() != 8 || !dni.matches("\\d{8}")) {
            System.out.println("Error: El DNI debe tener exactamente 8 dígitos.");
            return null;
        }
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "SELECT \n"
                    + "  e.id AS empleado_id,\n"
                    + "  e.dni,\n"
                    + "  e.nombres,\n"
                    + "  e.apePaterno,\n"
                    + "  e.apeMaterno,\n"
                    + "  e.correo,\n"
                    + "  e.telefono,\n"
                    + "  r.id AS rol_id,\n"
                    + "  r.nombre AS rol_nombre,\n"
                    + "  r.descripcion AS rol_descripcion,\n"
                    + "  es.id AS estado_id,\n"
                    + "  es.nombre AS estado_nombre,\n"
                    + "  es.descripcion AS estado_descripcion\n"
                    + "FROM BDCamas.Empleados e\n"
                    + "JOIN BDCamas.Roles r ON e.idRol = r.id\n"
                    + "JOIN BDCamas.EstadosEmpleado es ON e.idEstado = es.id where e.dni = ?";
            PreparedStatement sentencia = cnx.prepareStatement(query);
            sentencia.setString(1, dni);
            ResultSet resultado = sentencia.executeQuery();

            while (resultado.next()) {
                usr.setId(resultado.getLong("empleado_id"));
                usr.setDni(resultado.getString("dni"));
                usr.setNombres(resultado.getString("nombres"));
                usr.setApePaterno(resultado.getString("apePaterno"));
                usr.setApeMaterno(resultado.getString("apeMaterno"));
                usr.setTelefono(resultado.getString("telefono"));
                usr.setCorreo(resultado.getString("correo"));

                Rol rl = new Rol();
                rl.setId(resultado.getLong("rol_id"));
                rl.setNombre(resultado.getString("rol_nombre"));
                rl.setDescripcion(resultado.getString("rol_descripcion"));

                EstadoEmpleado esEmpleado = new EstadoEmpleado();
                esEmpleado.setId(resultado.getLong("estado_id"));
                esEmpleado.setNombre(resultado.getString("estado_nombre"));
                esEmpleado.setDescripcion(resultado.getString("estado_descripcion"));

                usr.setRol(rl);
                usr.setEstado(esEmpleado);
            }
            resultado.close();
            sentencia.close();
            cnx.close();
            return usr;
        } catch (SQLException e) {
            System.out.println("Error en getEmpleadoBy id: " + e.getMessage());
        }

        return usr;

    }

    public Usuario getUserById(String id) {
        Usuario usr = new Usuario();
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "SELECT \n"
                    + "  e.id AS empleado_id,\n"
                    + "  e.dni,\n"
                    + "  e.nombres,\n"
                    + "  e.apePaterno,\n"
                    + "  e.apeMaterno,\n"
                    + "  e.correo,\n"
                    + "  e.telefono,\n"
                    + "  r.id AS rol_id,\n"
                    + "  r.nombre AS rol_nombre,\n"
                    + "  r.descripcion AS rol_descripcion,\n"
                    + "  es.id AS estado_id,\n"
                    + "  es.nombre AS estado_nombre,\n"
                    + "  es.descripcion AS estado_descripcion\n"
                    + "FROM BDCamas.Empleados e\n"
                    + "JOIN BDCamas.Roles r ON e.idRol = r.id\n"
                    + "JOIN BDCamas.EstadosEmpleado es ON e.idEstado = es.id where e.id = ?";
            PreparedStatement sentencia = cnx.prepareStatement(query);
            sentencia.setString(1, id);
            ResultSet resultado = sentencia.executeQuery();

            while (resultado.next()) {
                usr.setId(resultado.getLong("empleado_id"));
                usr.setDni(resultado.getString("dni"));
                usr.setNombres(resultado.getString("nombres"));
                usr.setApePaterno(resultado.getString("apePaterno"));
                usr.setApeMaterno(resultado.getString("apeMaterno"));
                usr.setTelefono(resultado.getString("telefono"));
                usr.setCorreo(resultado.getString("correo"));

                Rol rl = new Rol();
                rl.setId(resultado.getLong("rol_id"));
                rl.setNombre(resultado.getString("rol_nombre"));
                rl.setDescripcion(resultado.getString("rol_descripcion"));

                EstadoEmpleado esEmpleado = new EstadoEmpleado();
                esEmpleado.setId(resultado.getLong("estado_id"));
                esEmpleado.setNombre(resultado.getString("estado_nombre"));
                esEmpleado.setDescripcion(resultado.getString("estado_descripcion"));

                usr.setRol(rl);
                usr.setEstado(esEmpleado);
            }
            resultado.close();
            sentencia.close();
            cnx.close();
            return usr;
        } catch (SQLException e) {
            System.out.println("Error en getEmpleadoBy id: " + e.getMessage());
        }

        return usr;

    }

    public List<Usuario> getUsers() {
        List<Usuario> lista = new ArrayList<>();
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "SELECT \n"
                    + "  e.id AS empleado_id,\n"
                    + "  e.dni,\n"
                    + "  e.nombres,\n"
                    + "  e.apePaterno,\n"
                    + "  e.apeMaterno,\n"
                    + "  e.correo,\n"
                    + "  e.telefono,\n"
                    + "  r.id AS rol_id,\n"
                    + "  r.nombre AS rol_nombre,\n"
                    + "  r.descripcion AS rol_descripcion,\n"
                    + "  es.id AS estado_id,\n"
                    + "  es.nombre AS estado_nombre,\n"
                    + "  es.descripcion AS estado_descripcion\n"
                    + "FROM BDCamas.Empleados e\n"
                    + "JOIN BDCamas.Roles r ON e.idRol = r.id\n"
                    + "JOIN BDCamas.EstadosEmpleado es ON e.idEstado = es.id";
            Statement sentencia = cnx.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);

            while (resultado.next()) {
                Usuario usr = new Usuario();
                usr.setId(resultado.getLong("empleado_id"));
                usr.setDni(resultado.getString("dni"));
                usr.setNombres(resultado.getString("nombres"));
                usr.setApePaterno(resultado.getString("apePaterno"));
                usr.setApeMaterno(resultado.getString("apeMaterno"));
                usr.setTelefono(resultado.getString("telefono"));
                usr.setCorreo(resultado.getString("correo"));

                Rol rl = new Rol();
                rl.setId(resultado.getLong("rol_id"));
                rl.setNombre(resultado.getString("rol_nombre"));
                rl.setDescripcion(resultado.getString("rol_descripcion"));

                EstadoEmpleado esEmpleado = new EstadoEmpleado();
                esEmpleado.setId(resultado.getLong("estado_id"));
                esEmpleado.setNombre(resultado.getString("estado_nombre"));
                esEmpleado.setDescripcion(resultado.getString("estado_descripcion"));

                usr.setRol(rl);
                usr.setEstado(esEmpleado);
                lista.add(usr);
            }

            resultado.close();
            sentencia.close();
            cnx.close();
        } catch (SQLException e) {
            System.out.println("Error en getUsers: " + e.getMessage());
        }
        return lista;
    }
}
