/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import modelo.Admin;

/**
 *
 * @author ucova
 */
public class AdminDAO extends BaseDAO<Admin>{

    @Override
    public Admin autenticacion(String usuario, String contrasenia) {
        Admin admin = null;
        try{
            Connection conexion = this.generarConexion();
            Statement comando = conexion.createStatement();
            String codigoSQL = String.format(
                "SELECT id, nombre_usuario, contrasenia FROM admins WHERE nombre_usuario = '%s' AND contrasenia = '%s'",
                    usuario, contrasenia
            );
            ResultSet resultado = comando.executeQuery(codigoSQL);
            if(resultado.next()){
                Integer id = resultado.getInt("id");
                admin = new Admin(id, usuario, contrasenia);
                System.out.println("Se autenticó el admin: " + usuario);
            }  
            conexion.close();
            return admin;
        } catch (SQLException ex){
            System.err.println(ex.getLocalizedMessage());
            return admin;
        }
    }

    @Override
    public ArrayList<Admin> consultar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Admin> consultarPorCliente(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Admin consultar(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void insertar(Admin entidad) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void actualizar(Admin entidad) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void eliminar(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
