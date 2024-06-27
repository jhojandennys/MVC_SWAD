
package utilidades;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Estudiante
 */
public class Conexion {

    private Connection cnx;

    public Connection conecta()  {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String usr = "root";
            String psw = "root";
            String url = "jdbc:mysql://localhost:33066/dbveterinaria?useSSL=false";
            cnx = DriverManager.getConnection(url, usr, psw);
            return cnx;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void closeResources(Connection con, Statement stmt) {
        try {
            if (stmt != null) {
                stmt.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public int pruebaConexion() throws ClassNotFoundException {
        Connection c = conecta();
        if (c != null) {
            return 1;
        } else {
            return 0;
        }
    }
}
