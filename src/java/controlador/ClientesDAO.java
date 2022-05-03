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
import modelo.Cliente;

/**
 *
 * @author ucova
 */
public class ClientesDAO extends BaseDAO<Cliente>{
    
    @Override
    public Cliente autenticacion(String usuario, String contrasenia){
        Cliente cliente = null;
        try{
            Connection conexion = this.generarConexion();
            Statement comando = conexion.createStatement();
            String codigoSQL = String.format(
                "SELECT id, usuario, email, contrasenia, nombre, apellido, telefono FROM clientes WHERE usuario = '%s' AND contrasenia = '%s'",
                    usuario, contrasenia
            );
            ResultSet resultado = comando.executeQuery(codigoSQL);
            if(resultado.next()){
                Integer id = resultado.getInt("id");
                String email = resultado.getString("email");
                String nombre = resultado.getString("nombre");
                String apellido = resultado.getString("apellido");
                String telefono = resultado.getString("telefono");
                cliente = new Cliente(id, nombre, apellido, email, telefono, usuario, contrasenia);
                System.out.println("Se autenticó el cliente: " + usuario);
            }  
            conexion.close();
            return cliente;
        } catch (SQLException ex){
            System.err.println(ex.getMessage());
            return cliente;
        }
    }

    @Override
    public ArrayList<Cliente> consultar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Cliente consultar(Integer id) {
       Cliente cliente = null;

        try {
            Connection conexion = this.generarConexion();
            Statement comando = conexion.createStatement();
            ResultSet resultado = comando.executeQuery(String.format("SELECT id,usuario,nombre,email,contrasenia,apellido,telefono FROM clientes WHERE id = %d", id));

            if (resultado.next()) {
                String email = resultado.getString("email");
                String nombre = resultado.getString("nombre");
                String apellido = resultado.getString("apellido");
                String usuario = resultado.getString("usuario");
                String contrasenia = resultado.getString("contrasenia");
                String telefono = resultado.getString("telefono");
                cliente = new Cliente(id, nombre, apellido, email, telefono, usuario, contrasenia);
            }

            conexion.close();
            return cliente;
            
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
            return cliente;
        }
    }

    @Override
    public void insertar(Cliente cliente) {
        try{
        // Conexión a través de un JDBC para MySQL indicando el servidor 
        // a conectarse con usuario y contraseña
        Connection conexion = this.generarConexion();
        // Se crea un objeto statement
        Statement comando = conexion.createStatement();
        // Se crea un objeto String con String.format para acomodar las variables
        // que se convertirán en formato SQL .
        String codigoSQL = String.format(
            "INSERT INTO clientes(usuario, email, contrasenia, nombre, apellido, telefono) VALUES('%s','%s','%s','%s','%s','%s')",
                cliente.getUsuario(),
                cliente.getEmail(),
                cliente.getContrasenia(),
                cliente.getNombre(),
                cliente.getApellido(),
                cliente.getTelefono()
        );
        // Se manda a llamar el objeto de Statement para usar el método
        // executeUpdate y recibe como parámetro el string creado arriba
        // para posteriormente registrarse en la BD.
        comando.executeUpdate(codigoSQL);
        conexion.close();
        System.out.println("Cliente se registró correctamente");
        } catch(SQLException ex){
            System.err.println(ex.getMessage());
        }
    }

    @Override
    public void actualizar(Cliente cliente) throws Exception {
        if(cliente.getIdCliente()== null){
            throw new Exception("Id de cliente no encontrado");
        }
        try{
            Connection conexion = this.generarConexion();
            Statement comando = conexion.createStatement();
            String codigoSQL = String.format(
                "UPDATE clientes SET usuario='%s', email='%s', contrasenia='%s', nombre='%s', apellido='%s', telefono='%s' WHERE id=%d",
                    cliente.getUsuario(),
                    cliente.getEmail(),
                    cliente.getContrasenia(),
                    cliente.getNombre(),
                    cliente.getApellido(),
                    cliente.getTelefono(),
                    cliente.getIdCliente()
            );
            int conteoRegistrosAfectados = comando.executeUpdate(codigoSQL);
            if (conteoRegistrosAfectados == 1) {
                System.out.println("Se actualizó el cliente");
            } else {
                System.out.println("No se pudo actualizar el cliente");
            }
        } catch(SQLException ex){
            System.err.println(ex.getMessage());
        }
    }

    @Override
    public void eliminar(Integer id) {
        try{
            Connection conexion = this.generarConexion();
            Statement comando = conexion.createStatement();
            String codigoSQL = String.format(
                "DELETE FROM clientes WHERE id = %d",
                    id
            );
            int conteoRegistrosAfectados = comando.executeUpdate(codigoSQL);
            if(conteoRegistrosAfectados == 1){
                System.out.println("Se eliminó el cliente: " + id);
            }
            conexion.close();
        } catch (SQLException ex){
            System.err.println(ex.getMessage());
        }
    }

    @Override
    public ArrayList<Cliente> consultarPorCliente(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
