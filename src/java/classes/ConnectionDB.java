/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author tona
 */
public class ConnectionDB {
    private String driverDB, urlDB, userDB, passwordDB;
    private Connection connection;
    private Statement statement;
    // Para pasar los datos dependiendo de la computadora y la configuracion de la PC
    public ConnectionDB(String driverDB, String urlDB, String userDB, String passwordDB) {
        this.driverDB = driverDB;
        this.urlDB = urlDB;
        this.userDB = userDB;
    }
    // Por defecto
    public ConnectionDB() {
        this.driverDB = "com.mysql.jdbc.Driver";
        this.urlDB = "jdbc:mysql://127.0.0.1:3306/adoo";
        this.userDB = "root";
        this.passwordDB = "root";
    }
    //Conexion a la BD
    public void connect(){
        try {
            Class.forName(driverDB).newInstance();
            connection = (Connection) DriverManager.getConnection(urlDB, userDB, passwordDB);

        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException err) {
            System.out.println("Error " + err.getMessage());
        }
    }
    //Cerrar la conexion de BD
    public void close() throws SQLException {
        connection.close();
    }
    //Metodos para ejecutar sentencias SQL
    public ResultSet consultar(String query) throws SQLException{
        statement = (Statement) connection.createStatement();
        return statement.executeQuery(query);
    }
    public void actualizar(String query) throws SQLException{
        statement = (Statement) connection.createStatement();
        statement.executeUpdate(query);
        statement.closeOnCompletion();
    }
    public int borrar(String query) throws SQLException{
        statement = (Statement) connection.createStatement();
        return statement.executeUpdate(query);
    }
    public void insertar(String query) throws SQLException{
        statement = (Statement) connection.createStatement();
        statement.executeUpdate(query);
    }
}
