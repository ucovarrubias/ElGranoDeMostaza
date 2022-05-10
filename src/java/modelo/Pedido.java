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
    private String folio;
    private Integer clienteId;
    private Float subtotal;
    private Float envio;
    private Float total;
    private Integer direccionId;
    private String emailPedido;
    private Date fechaPedido;
    private String estadoPedido;

    public Pedido() {
    }

    public Pedido(Integer clienteId) {
        this.clienteId = clienteId;
    }

    public Pedido(Integer id, String folio, Integer clienteId) {
        this.id = id;
        this.folio = folio;
        this.clienteId = clienteId;
    }    

    public Pedido(String folio, Integer clienteId, Float subtotal, Float envio, Float total, Integer direccionId, String emailPedido, Date fechaPedido, String estadoPedido) {
        this.folio = folio;
        this.clienteId = clienteId;
        this.subtotal = subtotal;
        this.envio = envio;
        this.total = total;
        this.direccionId = direccionId;
        this.emailPedido = emailPedido;
        this.fechaPedido = fechaPedido;
        this.estadoPedido = estadoPedido;
    }

    public Pedido(Integer id, String folio, Integer clienteId, Float subtotal, Float envio, Float total, Integer direccionId, String emailPedido, Date fechaPedido, String estadoPedido) {
        this.id = id;
        this.folio = folio;
        this.clienteId = clienteId;
        this.subtotal = subtotal;
        this.envio = envio;
        this.total = total;
        this.direccionId = direccionId;
        this.emailPedido = emailPedido;
        this.fechaPedido = fechaPedido;
        this.estadoPedido = estadoPedido;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFolio() {
        return folio;
    }

    public void setFolio(String folio) {
        this.folio = folio;
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

    public Float getEnvio() {
        return envio;
    }

    public void setEnvio(Float envio) {
        this.envio = envio;
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

    public String getEstadoPedido() {
        return estadoPedido;
    }

    public void setEstadoPedido(String estadoPedido) {
        this.estadoPedido = estadoPedido;
    }

    @Override
    public String toString() {
        return "Pedido{" + "id=" + id + ", folio=" + folio + ", clienteId=" + clienteId + ", subtotal=" + subtotal + ", envio=" + envio + ", total=" + total + ", direccionId=" + direccionId + ", emailPedido=" + emailPedido + ", fechaPedido=" + fechaPedido + ", estadoPedido=" + estadoPedido + '}';
    }
    
}
