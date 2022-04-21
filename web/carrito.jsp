<%-- 
    Document   : carrito
    Created on : Nov 25, 2021, 11:15:54 AM
    Author     : ucova
--%>

<%@page import="controlador.ProductosDAO"%>
<%@page import="modelo.Producto"%>
<%@page import="java.util.ArrayList"%>
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
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrito de compras</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/c7d94c22d4.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="50">
        <%-- Incluye la barra de navegación --%>
        <%@include file="jspf/navbar.jspf"%>
        
        <div class="container" style="padding-top:100px;">
            <div class="card-header my-3">Todos los productos del carrito</div>
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
                                    <form action="agregarCarrito?tarea=actualizarCarrito" method="POST">
                                        <input type="hidden" name="id" value="<%= c.getId() %>" />
                                        <div class="align-items-center d-flex justify-content-between">
                                            Cantidad: <input type="text" pattern="[0-9]{1,2}" title="La cantidad no debe ser menor a 0" name="cantidad" class="form-control mx-1" value="<%= c.getCantidad()%>"/>
                                            <button type="submit" class="mx-1 btn btn-light btn-sm">Actualizar</button>
                                        </div>
                                    </form>
                                    <small><a class="text-danger" style="text-decoration: none;" href="agregarCarrito?tarea=eliminarCarrito&id=<%= c.getId()%>">Eliminar art&iacute;culo</a></small>
                                </div>
                            </div>
                        </div>
                    <%}
                }
            %>
            </div>
            
            <hr>   
            <%
                    if(!listaCarrito.isEmpty()){ %>
            <div>
                <p>Subtotal: <strong>$<%= subtotal %></strong></p>
                <button type="button" onclick="document.location='pedido.jsp'" class="btn btn-primary btn-sm">Proceder al pago</button>
            </div>
                <% } else { %>
                    <h2>No hay productos en el carrito.</h2>
                <% } %>
        </div>
    </body>
</html>
