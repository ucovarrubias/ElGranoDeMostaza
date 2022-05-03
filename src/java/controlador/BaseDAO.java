/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ucova
 */
public abstract class BaseDAO<T> {
    
    private static final String CADENA_CONEXION = "jdbc:mysql://localhost:3306/tienda_virtual?autoReconnet=true&useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    private static final String USUARIO = "root";
    private static final String CONTRASENIA = "sesamo";
    private static final String CLASSNAME="com.mysql.jdbc.Driver";
    
    protected Connection generarConexion() throws SQLException{
        try {
            Class.forName(CLASSNAME);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BaseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return DriverManager.getConnection(CADENA_CONEXION, USUARIO, CONTRASENIA);
    }
    
    public abstract T autenticacion(String email, String contrasenia);
    public abstract ArrayList<T> consultar();
    public abstract ArrayList<T> consultarPorCliente(Integer id);
    public abstract T consultar(Integer id);
    public abstract void insertar(T entidad);
    public abstract void actualizar(T entidad) throws Exception;
    public abstract void eliminar(Integer id);
}