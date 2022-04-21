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
public class PedidoDetalles {
    private Integer id;
    private Integer pedidoId;
    private Integer productoId;
    private Float precio;
    private Integer cantidad;

    public PedidoDetalles() {
    }

    public PedidoDetalles(Integer pedidoId, Integer productoId, Float precio, Integer cantidad) {
        this.pedidoId = pedidoId;
        this.productoId = productoId;
        this.precio = precio;
        this.cantidad = cantidad;
    }

    public PedidoDetalles(Integer id, Integer pedidoId, Integer productoId, Float precio, Integer cantidad) {
        this.id = id;
        this.pedidoId = pedidoId;
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

    public Integer getPedidoId() {
        return pedidoId;
    }

    public void setPedidoId(Integer pedidoId) {
        this.pedidoId = pedidoId;
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
        return "PedidosDetalles{" + "id=" + id + ", pedidoId=" + pedidoId + ", productoId=" + productoId + ", precio=" + precio + ", cantidad=" + cantidad + '}';
    }
    
}
