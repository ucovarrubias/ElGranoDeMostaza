/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.sql.Connection;
import java.sql.Date;
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
      ArrayList<Pedido> listaPedidos = new ArrayList<>();

        try {
            Connection conexion = this.generarConexion();
            Statement comando = conexion.createStatement();
            ResultSet resultado = comando.executeQuery("SELECT id,folio,cliente_id,direccion_id,email_pedido,"
                    + "fecha_pedido,iva,subtotal,total FROM pedidos");

            while (resultado.next()) {

                Pedido pedido = new Pedido();

                pedido.setFolio(resultado.getString("folio"));
                pedido.setClienteId(resultado.getInt("cliente_id"));
                pedido.setDireccionId(resultado.getInt("direccion_id"));
                pedido.setEmailPedido(resultado.getString("email_pedido"));
                pedido.setFechaPedido(resultado.getDate("fecha_pedido"));
                pedido.setId(resultado.getInt("id"));
                pedido.setIva(resultado.getFloat("iva"));
                pedido.setSubtotal(resultado.getFloat("subtotal"));
                pedido.setTotal(resultado.getFloat("total"));

                listaPedidos.add(pedido);
            }
            conexion.close();
            return listaPedidos;

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return listaPedidos;
        }
    }

    @Override
    public Pedido consultar(Integer id) {
        Pedido pedido = null;
        try {
            Connection conexion = this.generarConexion();
            Statement comando = conexion.createStatement();
            String codigoSQL = String.format("SELECT MAX(id) AS max_id, folio FROM pedidos WHERE cliente_id = '%d'",
                    id
            );
            ResultSet resultado = comando.executeQuery(codigoSQL);
            if(resultado.next()){
                Integer ultimoId = resultado.getInt("max_id");
                String folio = resultado.getString("folio");
                pedido = new Pedido(ultimoId, folio, id);
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
            "INSERT INTO pedidos(folio, cliente_id, fecha_pedido) VALUES('%s', '%d', CURRENT_TIMESTAMP)",
                pedido.getFolio(),
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
    public ArrayList<Pedido> consultarPorCliente(Integer clienteId) {
        ArrayList<Pedido> listaPedidos = new ArrayList<>();
        try {
            Connection conexion = this.generarConexion();
            Statement comando = conexion.createStatement();
            String codigoSQL = String.format("SELECT * FROM pedidos WHERE cliente_id = '%d'",
                    clienteId
            );
            ResultSet resultado = comando.executeQuery(codigoSQL);
            while(resultado.next()){
                Integer id = resultado.getInt("id");
                String folio = resultado.getString("folio");
                Float subtotal = resultado.getFloat("subtotal");
                Float iva = resultado.getFloat("iva");
                Float total = resultado.getFloat("total");
                Integer direccion = resultado.getInt("direccion_id");
                String email_pedido = resultado.getString("email_pedido");
                Date fecha_pedido = resultado.getDate("fecha_pedido");
                
                Pedido pedido = new Pedido(id, folio, clienteId, subtotal, iva, total, direccion, email_pedido, fecha_pedido);
                listaPedidos.add(pedido);
            }
            conexion.close();
            System.out.println("Se consultaron los pedidos del cliente");
            return listaPedidos;
        } catch (SQLException ex){
            System.err.println(ex.getMessage());
            return listaPedidos;
        }
    }
    
    public ArrayList<Pedido> generarReportePeriodo(String inicio, String fin) {

        ArrayList<Pedido> listaSocios = new ArrayList<>();

        try {
            Connection conexion = this.generarConexion();
            Statement comando = conexion.createStatement();
            ResultSet resultado = comando.executeQuery("SELECT id,folio,cliente_id,direccion_id,email_pedido,"
                    + "fecha_pedido,iva,subtotal,total FROM pedidos WHERE fecha_pedido BETWEEN '" + inicio + "' AND '"
                    + fin + "'");

            while (resultado.next()) {

                Pedido pedido = new Pedido();

                pedido.setFolio(resultado.getString("folio"));
                pedido.setClienteId(resultado.getInt("cliente_id"));
                pedido.setDireccionId(resultado.getInt("direccion_id"));
                pedido.setEmailPedido(resultado.getString("email_pedido"));
                pedido.setFechaPedido(resultado.getDate("fecha_pedido"));
                pedido.setId(resultado.getInt("id"));
                pedido.setIva(resultado.getFloat("iva"));
                pedido.setSubtotal(resultado.getFloat("subtotal"));
                pedido.setTotal(resultado.getFloat("total"));

                listaSocios.add(pedido);
            }
            conexion.close();
            return listaSocios;

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return listaSocios;
        }
    }
    
}
