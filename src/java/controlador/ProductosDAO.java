/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import modelo.Producto;

/**
 *
 * @author ucova
 */
public class ProductosDAO extends BaseDAO<Producto>{

    @Override
    public Producto autenticacion(String email, String contrasenia) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Producto> consultar() {
        ArrayList<Producto> listaProductos = new ArrayList<>();
        try{
            Connection conexion = this.generarConexion();
            Statement comando = conexion.createStatement();
            String codigoSQL = "SELECT id, sku, nombre, precio, existencia, img FROM productos";
            ResultSet resultado = comando.executeQuery(codigoSQL);
            while(resultado.next()){
                Integer id = resultado.getInt("id");
                String sku = resultado.getString("sku");
                String nombre = resultado.getString("nombre");
                Float precio = resultado.getFloat("precio");
                Integer existencia = resultado.getInt("existencia");
                Blob blob = resultado.getBlob("img");
                byte[] imageBytes=blob.getBytes(1, (int)blob.length());
                String encodedImage=Base64.getEncoder().encodeToString(imageBytes);
                String img = "data:image/jpg;base64,"+ encodedImage;

                Producto producto = new Producto(id, sku, nombre, precio, existencia, img);
                listaProductos.add(producto);
            }
            conexion.close();
            System.out.println("Se consultaron los productos");
            return listaProductos;
        } catch (SQLException ex){
            System.err.println(ex.getMessage());
            return listaProductos;
        }
    }

    @Override
    public Producto consultar(Integer id) {
        Producto producto = null;
        try {
            Connection conexion = this.generarConexion();
            Statement comando = conexion.createStatement();
            String codigoSQL = String.format(
                "SELECT id, sku, nombre, precio, existencia, img FROM productos WHERE id = '%d'",
                    id
            );
            ResultSet resultado = comando.executeQuery(codigoSQL);
            if(resultado.next()){
                String sku = resultado.getString("sku");
                String nombre = resultado.getString("nombre");
                Float precio = resultado.getFloat("precio");
                Integer existencia = resultado.getInt("existencia");
                Blob blob = resultado.getBlob("img");
                byte[] imageBytes=blob.getBytes(1, (int)blob.length());
                String encodedImage=Base64.getEncoder().encodeToString(imageBytes);
                String img = "data:image/jpg;base64,"+ encodedImage;

                producto = new Producto(id, sku, nombre, precio, existencia, img);
                System.out.println("Se encontró el producto: " + id);
            }  
            conexion.close();
            return producto;
        } catch (SQLException ex){
            System.err.println(ex.getMessage());
            return producto;
        }
        
    }

    @Override
    public void insertar(Producto entidad) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void actualizar(Producto entidad) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void eliminar(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Producto> consultarPorCliente(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
