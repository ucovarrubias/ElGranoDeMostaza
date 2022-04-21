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
import modelo.Pedido;

/**
 *
 * @author ucova
 */
public class PedidosDAO extends BaseDAO<Pedido>{

    @Override
    public Pedido autenticacion(String email, String contrasenia) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Pedido> consultar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Pedido consultar(Integer id) {
        Pedido pedido = null;
        try {
            Connection conexion = this.generarConexion();
            Statement comando = conexion.createStatement();
            String codigoSQL = String.format("SELECT MAX(id) AS max_id FROM pedidos WHERE cliente_id = '%d'",
                    id
            );
            ResultSet resultado = comando.executeQuery(codigoSQL);
            if(resultado.next()){
                Integer ultimoId = resultado.getInt("max_id");
                pedido = new Pedido(ultimoId, id);
                return pedido;
            }
        } catch (SQLException ex){
            System.err.println(ex.getMessage());
        }
        return pedido;
    }

    @Override
    public void insertar(Pedido pedido) {
        try{
        // Conexión a través de un JDBC para MySQL indicando el servidor 
        // a conectarse con usuario y contraseña
        Connection conexion = this.generarConexion();
        // Se crea un objeto statement
        Statement comando = conexion.createStatement();
        // Se crea un objeto String con String.format para acomodar las variables
        // que se convertirán en formato SQL .
        String codigoSQL = String.format(
            "INSERT INTO pedidos(cliente_id, fecha_pedido) VALUES('%d', CURRENT_TIMESTAMP)",
                pedido.getClienteId()
//                pedido.getSubtotal(),
//                pedido.getIva(),
//                pedido.getTotal(),
//                pedido.getDireccionPedido(),
//                pedido.getEmailPedido(),
//                pedido.getFechaPedido()
        );
        // Se manda a llamar el objeto de Statement para usar el método
        // executeUpdate y recibe como parámetro el string creado arriba
        // para posteriormente registrarse en la BD.
        comando.executeUpdate(codigoSQL);
        conexion.close();
        System.out.println("Pedido se registró correctamente");
        } catch(SQLException ex){
            System.err.println(ex.getMessage());
        }
    }

    @Override
    public void actualizar(Pedido pedido) throws Exception {
        if(pedido.getId()== null){
            throw new Exception("Pedido no encontrado");
        }
        try{
            Connection conexion = this.generarConexion();
            Statement comando = conexion.createStatement();
            String codigoSQL = String.format(
                "UPDATE pedidos SET subtotal='%f',iva='%f', total='%f', direccion_id='%s', email_pedido='%s' WHERE id='%d'",
                pedido.getSubtotal(),
                pedido.getIva(),
                pedido.getTotal(),
                pedido.getDireccionId(),
                pedido.getEmailPedido(),
                pedido.getId()
            );
            int conteoRegistrosAfectados = comando.executeUpdate(codigoSQL);
            if (conteoRegistrosAfectados == 1) {
                System.out.println("Se actualizó el pedido");
            } else {
                System.out.println("No se pudo actualizar el pedido");
            }
        } catch(SQLException ex){
            System.err.println(ex.getMessage());
        }
    }

    @Override
    public void eliminar(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Pedido> consultarPorCliente(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
