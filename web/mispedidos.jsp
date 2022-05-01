<%-- 
    Document   : mispedidos
    Created on : Apr 25, 2022, 11:52:45 PM
    Author     : ucova
--%>

<%@page import="modelo.Direccion"%>
<%@page import="controlador.DireccionesDAO"%>
<%@page import="controlador.ProductosDAO"%>
<%@page import="controlador.BaseDAO"%>
<%@page import="modelo.Producto"%>
<%@page import="modelo.PedidoDetalles"%>
<%@page import="modelo.Pedido"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <%
            Cliente cliente = (Cliente) session.getAttribute("cliente");
            ArrayList<Pedido> listaPedidos = new ArrayList<Pedido>();
            ArrayList<PedidoDetalles> listaPedidoDetalles = new ArrayList<PedidoDetalles>();
            BaseDAO<Producto> daoProducto = null;
            BaseDAO<Direccion> daoDireccion = null;
            if (null == cliente) {
                response.sendRedirect("index.jsp");
            } else {
                listaPedidos = (ArrayList<Pedido>) request.getAttribute("listaPedidos");
                listaPedidoDetalles = (ArrayList<PedidoDetalles>) request.getAttribute("listaPedidoDetalles");
                daoProducto = new ProductosDAO();
                daoDireccion = new DireccionesDAO();
            }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mis pedidos</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/c7d94c22d4.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="50">
        
        <%-- Incluye la barra de navegación --%>
        <%@include file="jspf/navbar.jspf"%>
        
        <div class="container-fluid m-0 px-0" style="padding-top:80px;">
            <nav class="navbar navbar-expand-sm bg-none justify-content-center mb-2">
                <h5 class="h5 px-3"><a href="home.jsp" style=" text-decoration: none; color: inherit;"><i class="fa-solid fa-circle-user"></i> Mi perfil</a></h5>
                <h5 class="h5 px-3"><i class="fa-solid fa-box"></i> Mis pedidos</h5>
                     <h5 class="h5 px-3"><a href="Pagina1.jsp" style=" text-decoration: none; color: inherit;"><i class="fa-solid fa-chevron-right"></i> Cargar Imagen</a></h5>
             </nav>
            <%
                if(!listaPedidos.isEmpty()){
                    for(Pedido pedi: listaPedidos){
                        Direccion dir = daoDireccion.consultar(pedi.getClienteId());
            %>
            <div class="row">
                <div class="col-sm-3"></div>
                <div class="col-sm-6">
                    <table class="table table-striped">
                        <tr>
                            <th>PEDIDO REALIZADO</th>
                            <th>TOTAL</th>
                            <th style="text-align: right;">DIRECCI&Oacute;N</th>
                        </tr>
                        <tr>
                            <td><%=pedi.getFechaPedido()%></th>
                            <td>$<%=pedi.getTotal()%></th>
                            <td style="text-align: right;"><%= dir.toString() %></th>
                        </tr>
                    </table>
                        <table class="table">   
                            <tr>
                            <th>Detalles del pedido</th>
                            <th>Nombre del producto:</th>
                            <th>Cantidad:</th>
                            <th style="text-align: right;">Precio unitario:</th>
                        </tr>
                        <%  for(PedidoDetalles pd: listaPedidoDetalles){
                                if (pedi.getId() == pd.getPedidoId()){
                                    Producto prod = daoProducto.consultar(pd.getProductoId());%>
                        
                        <tr>
                            <td><img class="card-img-top" style="width: 10rem;" src="<%= prod.getImagen() %>" alt="imagen"></th>
                            <td><%=prod.getNombre()%></th>
                            <td><%=pd.getCantidad()%></th>
                            <td style="text-align: right;">$<%=pd.getPrecio()%></th>
                        </tr>
                        <%      }
                            }%>
                    </table>
                    <br>
                </div>
                <div class="col-sm-3"></div>
            </div>
            <% }} else { %>
                <h2>No hay productos en el carrito.</h2>
            <% } %>
        </div>
    </body>
</html>
