<%-- 
    Document   : pedido
    Created on : Dec 6, 2021, 10:52:30 PM
    Author     : ucova
--%>

<%@page import="modelo.Direccion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controlador.ProductosDAO"%>
<%@page import="modelo.Producto"%>
<%@page import="controlador.CarritoDAO"%>
<%@page import="modelo.Carrito"%>
<%@page import="controlador.BaseDAO"%>
<%@page import="modelo.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    BaseDAO<Carrito> fachada = new CarritoDAO();
    BaseDAO<Producto> daoProducto = new ProductosDAO();
    Float subtotal = 0.00f;

%>

<!DOCTYPE html>
<html>
    <head>
        <%
            Cliente cliente = (Cliente) session.getAttribute("cliente");
            ArrayList<Carrito> listaCarrito = fachada.consultarPorCliente(cliente.getIdCliente());
            Direccion direccion = (Direccion) session.getAttribute("direccion");
        %>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/c7d94c22d4.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <title>Resumen del pedido</title>
    </head>
    <body>
        <div class="container">
            <h3 class="mt-5">Revisa tu pedido</h3>
            <hr>
            <div class="row">
                <div class="col">
                    <table class="table">
                        <small><strong>Direcci&oacute;n de env&iacute;o</strong></small>
                        <tr>
                            <td>Nombre: </td>
                            <td>${cliente.nombre} ${cliente.apellido}</td>
                        </tr>
                        <tr>
                            <td>Direcci&oacute;n: </td>
                            <td>${direccion.calle}</td>
                        </tr>
                        <tr>
                            <td>N&uacute;mero exterior: </td>
                            <td>${direccion.numExterior}</td>
                        </tr>
                        <tr>
                            <td>C&oacute;digo postal: </td>
                            <td>${direccion.codigoPostal}</td>
                        </tr>
                        <tr>
                            <td>Ciudad: </td>
                            <td>${direccion.ciudad}</td>
                        </tr>
                        <tr>
                            <td>Estado:</td>
                            <td>${direccion.estado}</td>
                        </tr>
                        <tr>
                            <td>Pa&iacute;s: </td>
                            <td>${direccion.pais}</td>
                        </tr>
                        <tr>
                            <td>Tel&eacute;fono: </td>
                            <td>${cliente.telefono}</td>
                        </tr>
                    </table>
                </div>
                <div class="col"></div>
                <div class="col"></div>
            </div>
            <div class="row">
                <div class="container mt-3">
                    <div class="card-header my-3">Productos del carrito</div>
                    <div class="row">
                        <%
                            if(!listaCarrito.isEmpty()){
                                for(Carrito c: listaCarrito){
                                    Producto producto = daoProducto.consultar(c.getProductoId());
                                %>
                                <div class="col-md-3 my-3">
                                    <div class="card w-100" style="width: 18rem;">
                                        <img class="card-img-top" src="<%= producto.getImagen() %>" alt="imagen">
                                        <div class="card-body">
                                            <h5 class="card-title"><%= producto.getNombre() %></h5>
                                            <h6>Precio: $<%= c.getPrecio()%><% subtotal += c.getPrecio() * c.getCantidad(); %></h6>
                                            <h6>Cantidad: <%= c.getCantidad()%></h6>
                                        </div>
                                    </div>
                                </div>
                            <%}
                        }
                    %>
                    </div>

                    <hr>   
                    <div class="text-end">
                        <p>Subtotal: <strong>$<%= subtotal %></strong></p>
                        <p>I.V.A.: <strong>$<%= subtotal * 0.16f %></strong></p>
                        <p>Total: <strong>$<%= subtotal * 1.16f %></strong></p>
                        <button type="button" onclick="document.location='registrarPedido'" class="btn btn-primary mb-5">Realizar tu pedido y paga</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
