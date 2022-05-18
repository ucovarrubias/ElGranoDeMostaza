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
        <script src="https://www.paypal.com/sdk/js?client-id=ATNuZxiukqukqfdRNmb4wJKGp94l7XLea4U5y_Xqh4w1E47lIsqxENVD6gE_ILKqWcp3jIE6xRKovrh2&components=buttons&currency=MXN"></script>
        
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
                <div class="col-sm-4">
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
                        <div class="col-sm-8">
                            <div class="card-header my-3">Productos del carrito</div>
                            <div class="container">
                                <div class="row">
                            <%
                            if(!listaCarrito.isEmpty()){
                                for(Carrito c: listaCarrito){
                                    Producto producto = daoProducto.consultar(c.getProductoId());
                                %>
                                    <div class="card" style="width: 10rem;">
                                        <img class="card-img-top mt-3" src="<%= producto.getImagen() %>" alt="imagen">
                                        <div class="card-body">
                                            <h6 class="card-title"><%= producto.getNombre() %></h6>
                                            <p class="my-0">Precio: $<%= c.getPrecio()%><% subtotal += c.getPrecio() * c.getCantidad(); %></p>
                                            <p class="mb-0">Cantidad: <%= c.getCantidad()%></p>
                                        </div>
                                    </div>
                                        
                            <%}
                        }
                    %>
                    </div>
                    </div>
                                        </div>
            </div>
            <div class="row">
                    <hr>   
                    <div class="text-end mb-5">
                        <p>Subtotal: <strong>$<%= subtotal %></strong></p>
                        <p>Envio: <strong>$<%= subtotal * 0.16f %></strong></p>
                        <p>Total: <strong>$<%= subtotal * 1.16f %></strong></p>
                        <h3>Formas de pago:</h3>
                        <hr>
                        <div class="my-3">
                            <button class="btn btn-light" data-bs-toggle="collapse" data-bs-target="#paypal" aria-expanded="false" aria-controls="paypal">Pagar con Paypal</button>
                            <div class="collapse" id="paypal">
                                <div class="my-3" id="paypal-button-container"></div>
                                <script>
                                    paypal.Buttons({
                                        createOrder: function(data, actions) {
                                          // Set up the transaction
                                          return actions.order.create({
                                            purchase_units: [{
                                              amount: {
                                                value: <%= subtotal * 1.16f %>
                                              }
                                            }]
                                          });
                                        },
                                        onApprove: function(data, actions) {
                                          // This function captures the funds from the transaction.
                                            return actions.order.capture().then(function(details) {
                                                alert('¡Pago realizado exitósamente!');
                                                window.location.href = ("registrarPedido?tarea=paypal");
                                            });
        //                                    // This function shows a transaction success message to your buyer.
        //                                    alert('Transaction completed by ' + details.payer.name.given_name);
        //                                  });
                                            
                                        }
                                      }).render('#paypal-button-container')
                                </script>
                            </div>
                        </div>
                        <button class="btn btn-light" data-bs-toggle="collapse" data-bs-target="#transferencia" aria-expanded="false" aria-controls="transferencia">Pagar por medio de transferencia bancaria</button>
                        <div class="collapse my-3" id="transferencia">
                            <button type="button" onclick="document.location='registrarPedido?tarea=transf'" class="btn btn-primary">Realizar tu pedido y paga por transferencia</button>
                        </div>
                        <script>
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
