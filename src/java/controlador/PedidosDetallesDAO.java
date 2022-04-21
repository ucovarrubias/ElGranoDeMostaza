/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import modelo.PedidoDetalles;

/**
 *
 * @author ucova
 */
public class PedidosDetallesDAO extends BaseDAO<PedidoDetalles>{

    @Override
    public PedidoDetalles autenticacion(String email, String contrasenia) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<PedidoDetalles> consultar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public PedidoDetalles consultar(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void insertar(PedidoDetalles pedidoDetalle) {
        try{
        // Conexión a través de un JDBC para MySQL indicando el servidor 
        // a conectarse con usuario y contraseña
        Connection conexion = this.generarConexion();
        // Se crea un objeto statement
        Statement comando = conexion.createStatement();
        // Se crea un objeto String con String.format para acomodar las variables
        // que se convertirán en formato SQL .
        String codigoSQL = String.format(
            "INSERT INTO pedidos_detalles(pedido_id, producto_id, precio, cantidad) VALUES('%d', '%d','%f','%d')",
                pedidoDetalle.getPedidoId(),
                pedidoDetalle.getProductoId(),
                pedidoDetalle.getPrecio(),
                pedidoDetalle.getCantidad()
//                pedido.getDireccionPedido(),
//                pedido.getEmailPedido(),
//                pedido.getFechaPedido()
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
    public void actualizar(PedidoDetalles entidad) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void eliminar(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<PedidoDetalles> consultarPorCliente(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
