/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author ucova
 */
public class Carrito {
    private Integer id;
    private Integer clienteId;
    private Integer productoId;
    private Float precio;
    private Integer cantidad;

    public Carrito() {
    }

    public Carrito(Integer clienteId, Integer productoId, Float precio, Integer cantidad) {
        this.clienteId = clienteId;
        this.productoId = productoId;
        this.precio = precio;
        this.cantidad = cantidad;
    }

    public Carrito(Integer id, Integer clienteId, Integer productoId, Float precio, Integer cantidad) {
        this.id = id;
        this.clienteId = clienteId;
        this.productoId = productoId;
        this.precio = precio;
        this.cantidad = cantidad;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getClienteId() {
        return clienteId;
    }

    public void setClienteId(Integer clienteId) {
        this.clienteId = clienteId;
    }

    public Integer getProductoId() {
        return productoId;
    }

    public void setProductoId(Integer productoId) {
        this.productoId = productoId;
    }

    public Float getPrecio() {
        return precio;
    }

    public void setPrecio(Float precio) {
        this.precio = precio;
    }

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }

    @Override
    public String toString() {
        return "Carrito{" + "id=" + id + ", clienteId=" + clienteId + ", productoId=" + productoId + ", precio=" + precio + ", cantidad=" + cantidad + '}';
    }
    
}
