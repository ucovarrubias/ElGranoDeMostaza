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
import modelo.Carrito;

/**
 *
 * @author ucova
 */
public class CarritoDAO extends BaseDAO<Carrito>{

    @Override
    public Carrito autenticacion(String email, String contrasenia) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Carrito> consultar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    @Override
    public ArrayList<Carrito> consultarPorCliente(Integer clienteId) {
        ArrayList<Carrito> listaCarrito = new ArrayList<>();
        try{
            Connection conexion = this.generarConexion();
            Statement comando = conexion.createStatement();
            String codigoSQL = String.format(
                "SELECT id, cliente_id, producto_id, precio, cantidad FROM carrito WHERE cliente_id = %d",
                    clienteId
            );
            ResultSet resultado = comando.executeQuery(codigoSQL);
            while(resultado.next()){
                Integer id = resultado.getInt("id");
                clienteId = resultado.getInt("cliente_id");
                Integer productoId = resultado.getInt("producto_id");
                Float precio = resultado.getFloat("precio");
                Integer cantidad = resultado.getInt("cantidad");

                Carrito carrito = new Carrito(id, clienteId, productoId, precio, cantidad);
                listaCarrito.add(carrito);
            }
            conexion.close();
            System.out.println("Se consulto el carrito del cliente");
            return listaCarrito;
        } catch (SQLException ex){
            System.err.println(ex.getMessage());
            return listaCarrito;
        }
    }

    @Override
    public Carrito consultar(Integer id) {
        Carrito carrito = null;
        try{
            Connection conexion = this.generarConexion();
            Statement comando = conexion.createStatement();
            String codigoSQL = String.format(
                "SELECT id, cliente_id, producto_id, precio, cantidad FROM carrito WHERE id = %d",
                    id
            );
            ResultSet resultado = comando.executeQuery(codigoSQL);
            while(resultado.next()){
                Integer clienteId = resultado.getInt("cliente_id");
                Integer productoId = resultado.getInt("producto_id");
                Float precio = resultado.getFloat("precio");
                Integer cantidad = resultado.getInt("cantidad");

                carrito = new Carrito(id, clienteId, productoId, precio, cantidad);
            }
            conexion.close();
            System.out.println("Se consulto el carrito del cliente");
            return carrito;
        } catch (SQLException ex){
            System.err.println(ex.getMessage());
            return carrito;
        }
    }

    @Override
    public void insertar(Carrito carrito) {
        try{
        // Conexión a través de un JDBC para MySQL indicando el servidor 
        // a conectarse con usuario y contraseña
        Connection conexion = this.generarConexion();
        // Se crea un objeto statement
        Statement comando = conexion.createStatement();
        // Se crea un objeto String con String.format para acomodar las variables
        // que se convertirán en formato SQL .
        String codigoSQL = String.format(
            "INSERT INTO carrito(cliente_id, producto_id, precio, cantidad) VALUES('%d','%d','%f','%d')",
                carrito.getClienteId(),
                carrito.getProductoId(),
                carrito.getPrecio(),
                carrito.getCantidad()
        );
        // Se manda a llamar el objeto de Statement para usar el método
        // executeUpdate y recibe como parámetro el string creado arriba
        // para posteriormente registrarse en la BD.
        comando.executeUpdate(codigoSQL);
        conexion.close();
        System.out.println("Carrito se registró correctamente");
        } catch(SQLException ex){
            System.err.println(ex.getMessage());
        }
    }

    @Override
    public void actualizar(Carrito carrito) throws Exception {
        if(carrito.getId()== null){
            throw new Exception("Carrito no encontrado");
        }
        try{
            Connection conexion = this.generarConexion();
            Statement comando = conexion.createStatement();
            String codigoSQL = String.format(
                "UPDATE carrito SET cantidad='%d' WHERE id=%d",
                carrito.getCantidad(),
                carrito.getId()
            );
            int conteoRegistrosAfectados = comando.executeUpdate(codigoSQL);
            if (conteoRegistrosAfectados == 1) {
                System.out.println("Se actualizó el carrito");
            } else {
                System.out.println("No se pudo actualizar el carrito");
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
                "DELETE FROM carrito WHERE id = %d",
                    id
            );
            int conteoRegistrosAfectados = comando.executeUpdate(codigoSQL);
            if(conteoRegistrosAfectados == 1){
                System.out.println("Se eliminó el carrito con id: " + id);
            }
            conexion.close();
        } catch (SQLException ex){
            System.err.println(ex.getMessage());
        }
    }
    
}
