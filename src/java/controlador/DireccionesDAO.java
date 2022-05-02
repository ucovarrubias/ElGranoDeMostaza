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
import modelo.Direccion;

/**
 *
 * @author ucova
 */
public class DireccionesDAO extends BaseDAO<Direccion> {

    @Override
    public Direccion autenticacion(String email, String contrasenia) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Direccion> consultar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Direccion> consultarPorCliente(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Direccion consultar(Integer clienteId) {
        Direccion direccion = null;
        try {
            Connection conexion = this.generarConexion();
            Statement comando = conexion.createStatement();
            String codigoSQL = String.format("SELECT id, calle, num_exterior, codigo_postal, ciudad, estado, pais FROM direcciones WHERE cliente_id = '%d'",
                    clienteId
            );
            ResultSet resultado = comando.executeQuery(codigoSQL);
            if (resultado.next()) {
                Integer id = resultado.getInt("id");
                String calle = resultado.getString("calle");
                String numExterior = resultado.getString("num_exterior");
                String codigoPostal = resultado.getString("codigo_postal");
                String ciudad = resultado.getString("ciudad");
                String estado = resultado.getString("estado");
                String pais = resultado.getString("pais");
                direccion = new Direccion(id, calle, numExterior, Integer.parseInt(codigoPostal), ciudad, estado, pais, clienteId);
            }
            conexion.close();
            return direccion;
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        return direccion;
    }

    @Override
    public void insertar(Direccion direccion) {
        try {
            // Conexión a través de un JDBC para MySQL indicando el servidor 
            // a conectarse con usuario y contraseña
            Connection conexion = this.generarConexion();
            // Se crea un objeto statement
            Statement comando = conexion.createStatement();
            // Se crea un objeto String con String.format para acomodar las variables
            // que se convertirán en formato SQL .
            String codigoSQL = String.format(
                    "INSERT INTO direcciones(calle, num_exterior, codigo_postal, ciudad, estado, pais, cliente_id) VALUES('%s','%s','%s','%s','%s','%s','%d')",
                    direccion.getCalle(),
                    direccion.getNumExterior(),
                    direccion.getCodigoPostal(),
                    direccion.getCiudad(),
                    direccion.getEstado(),
                    direccion.getPais(),
                    direccion.getClienteId()
            );
            // Se manda a llamar el objeto de Statement para usar el método
            // executeUpdate y recibe como parámetro el string creado arriba
            // para posteriormente registrarse en la BD.
            comando.executeUpdate(codigoSQL);
            conexion.close();
            System.out.println("Dirección se registró correctamente");
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }

    @Override
    public void actualizar(Direccion direccion) throws Exception {
        if (direccion.getClienteId() == null) {
            throw new Exception("Dirección del cliente no encontrado");
        }
        try {
            Connection conexion = this.generarConexion();
            Statement comando = conexion.createStatement();
            String codigoSQL = String.format(
                    "UPDATE direcciones SET calle='%s', num_exterior='%s', codigo_postal='%s', ciudad='%s', estado='%s', pais='%s' WHERE cliente_id=%d",
                    direccion.getCalle(),
                    direccion.getNumExterior(),
                    direccion.getCodigoPostal(),
                    direccion.getCiudad(),
                    direccion.getEstado(),
                    direccion.getPais(),
                    direccion.getClienteId()
            );
            int conteoRegistrosAfectados = comando.executeUpdate(codigoSQL);
            if (conteoRegistrosAfectados == 1) {
                System.out.println("Se actualizó la dirección");
            } else {
                System.out.println("No se pudo actualizar la dirección");
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }

    @Override
    public void eliminar(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public Direccion consultarPorId(Integer direccionId) {
        Direccion direccion = null;
        try {
            Connection conexion = this.generarConexion();
            Statement comando = conexion.createStatement();
            String codigoSQL = String.format("SELECT calle, num_exterior, codigo_postal, ciudad, estado, pais, cliente_id FROM direcciones WHERE id = '%d'",
                    direccionId
            );
            ResultSet resultado = comando.executeQuery(codigoSQL);
            if (resultado.next()) {
                String calle = resultado.getString("calle");
                String numExterior = resultado.getString("num_exterior");
                String codigoPostal = resultado.getString("codigo_postal");
                String ciudad = resultado.getString("ciudad");
                String estado = resultado.getString("estado");
                String pais = resultado.getString("pais");
                String clienteId = resultado.getString("cliente_id");

                direccion = new Direccion(direccionId, calle, numExterior, Integer.parseInt(codigoPostal), ciudad, estado, pais, Integer.parseInt(clienteId));
                return direccion;
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        return direccion;
    }

}
