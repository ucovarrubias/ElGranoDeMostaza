/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Date;

/**
 *
 * @author ucova
 */
public class Pedido {
    private Integer id;
    private Integer clienteId;
    private Float subtotal;
    private Float iva;
    private Float total;
    private Integer direccionId;
    private String emailPedido;
    private Date fechaPedido;

    public Pedido() {
    }

    public Pedido(Integer clienteId) {
        this.clienteId = clienteId;
    }

    public Pedido(Integer id, Integer clienteId) {
        this.id = id;
        this.clienteId = clienteId;
    }    

    public Pedido(Integer clienteId, Float subtotal, Float iva, Float total, Integer direccionId, String emailPedido, Date fechaPedido) {
        this.clienteId = clienteId;
        this.subtotal = subtotal;
        this.iva = iva;
        this.total = total;
        this.direccionId = direccionId;
        this.emailPedido = emailPedido;
        this.fechaPedido = fechaPedido;
    }

    public Pedido(Integer id, Integer clienteId, Float subtotal, Float iva, Float total, Integer direccionId, String emailPedido, Date fechaPedido) {
        this.id = id;
        this.clienteId = clienteId;
        this.subtotal = subtotal;
        this.iva = iva;
        this.total = total;
        this.direccionId = direccionId;
        this.emailPedido = emailPedido;
        this.fechaPedido = fechaPedido;
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

    public Float getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Float subtotal) {
        this.subtotal = subtotal;
    }

    public Float getIva() {
        return iva;
    }

    public void setIva(Float iva) {
        this.iva = iva;
    }

    public Float getTotal() {
        return total;
    }

    public void setTotal(Float total) {
        this.total = total;
    }

    public Integer getDireccionId() {
        return direccionId;
    }

    public void setDireccionId(Integer direccionId) {
        this.direccionId = direccionId;
    }

    public String getEmailPedido() {
        return emailPedido;
    }

    public void setEmailPedido(String emailPedido) {
        this.emailPedido = emailPedido;
    }

    public Date getFechaPedido() {
        return fechaPedido;
    }

    public void setFechaPedido(Date fechaPedido) {
        this.fechaPedido = fechaPedido;
    }

    @Override
    public String toString() {
        return "Pedido{" + "id=" + id + ", clienteId=" + clienteId + ", subtotal=" + subtotal + ", iva=" + iva + ", total=" + total + ", direccionId=" + direccionId + ", emailPedido=" + emailPedido + ", fechaPedido=" + fechaPedido + '}';
    }
    
}
