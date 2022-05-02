/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.awt.image.BufferedImage;
import java.io.InputStream;
import java.sql.Blob;

/**
 *
 * @author ucova
 */
public class Producto {
    private Integer id;
    private String sku;
    private String nombre;
    private Float precio;
    private Integer existencia;
    private String imagen;

    public Producto() {
    }

    public Producto(String sku, String nombre, Float precio, Integer existencia, String imagen) {
        this.sku = sku;
        this.nombre = nombre;
        this.precio = precio;
        this.existencia = existencia;
        this.imagen = imagen;
    }

    public Producto(Integer id, String sku, String nombre, Float precio, Integer existencia, String imagen) {
        this.id = id;
        this.sku = sku;
        this.nombre = nombre;
        this.precio = precio;
        this.existencia = existencia;
        this.imagen = imagen;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Float getPrecio() {
        return precio;
    }

    public void setPrecio(Float precio) {
        this.precio = precio;
    }

    public Integer getExistencia() {
        return existencia;
    }

    public void setExistencia(Integer existencia) {
        this.existencia = existencia;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
    
    @Override
    public String toString() {
        return "Producto{" + "id=" + id + ", sku=" + sku + ", nombre=" + nombre + ", precio=" + precio + ", existencia=" + existencia + '}';
    }
}
