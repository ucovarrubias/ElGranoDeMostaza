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
public class Direccion {
    private Integer id;
    private String calle;
    private String numExterior;
    private Integer codigoPostal;
    private String ciudad;
    private String estado;
    private String pais;
    private Integer clienteId;
    
    public Direccion() {
    }

    public Direccion(String calle, String numExterior, Integer codigoPostal, String ciudad, String estado, String pais, Integer clienteId) {
        this.calle = calle;
        this.numExterior = numExterior;
        this.codigoPostal = codigoPostal;
        this.ciudad = ciudad;
        this.estado = estado;
        this.pais = pais;
        this.clienteId = clienteId;
    }

    public Direccion(Integer id, String calle, String numExterior, Integer codigoPostal, String ciudad, String estado, String pais, Integer clienteId) {
        this.id = id;
        this.calle = calle;
        this.numExterior = numExterior;
        this.codigoPostal = codigoPostal;
        this.ciudad = ciudad;
        this.estado = estado;
        this.pais = pais;
        this.clienteId = clienteId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public String getNumExterior() {
        return numExterior;
    }

    public void setNumExterior(String numExterior) {
        this.numExterior = numExterior;
    }

    public Integer getCodigoPostal() {
        return codigoPostal;
    }

    public void setCodigoPostal(Integer codigoPostal) {
        this.codigoPostal = codigoPostal;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public Integer getClienteId() {
        return clienteId;
    }

    public void setClienteId(Integer clienteId) {
        this.clienteId = clienteId;
    }   

    @Override
    public String toString() {
        return "Direccion{" + "id=" + id + ", calle=" + calle + ", numExterior=" + numExterior + ", codigoPostal=" + codigoPostal + ", ciudad=" + ciudad + ", estado=" + estado + ", pais=" + pais + '}';
    }
    
}
