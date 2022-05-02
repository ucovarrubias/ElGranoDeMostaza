<%-- 
    Document   : productos
    Created on : Nov 25, 2021, 7:58:16 AM
    Author     : ucova
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="controlador.ProductosDAO"%>
<%@page import="modelo.Producto"%>
<%@page import="controlador.BaseDAO"%>
<%@page import="modelo.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    BaseDAO<Producto> fachada = new ProductosDAO();
    ArrayList<Producto> listaProductos = fachada.consultar();
%>
<!DOCTYPE html>
<html>
    <head>
        <%
            Cliente cliente = (Cliente) session.getAttribute("cliente");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>El Grano de Mostaza</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/c7d94c22d4.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="50">
        
        <%-- Incluye la barra de navegación --%>
        <%@include file="jspf/navbar.jspf"%>
        
        <!-- Off-canvas de inicio de sesión-->
        <div class="offcanvas offcanvas-end" id="demo">
            <div class="offcanvas-header">
                <div class="container">
                    <form action="iniciarSesion" method="POST">
                        <div class="my-3">
                            <label for="usuario" class="form-label">Usuario:</label>
                            <input type="text" class="form-control" id="usuario" placeholder="Usuario" name="usuario" required>
                        </div>
                        <div class="mb-3">
                            <label for="contrasenia" class="form-label">Contrase&ntilde;a:</label>
                            <input type="password" class="form-control" id="contrasenia" placeholder="Contrase&ntilde;a" name="contrasenia" required>
                            
                            <div style="color: #FF0000;">${errorMessage}</div>
                        </div>

                        <!--                    
                        <div class="form-check m-3">
                            <label class="form-check-label">
                                <input class="form-check-input" type="checkbox" name="remember"> Remember me
                            </label>
                        </div>
                        -->
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary btn-block my-1">Iniciar sesi&oacute;n</button>
                        </div>
                    </form>
                        <p class="text-center mt-1"><a href="#">¿Ha olvidado su contrase&ntilde;a?</a></p>
                        <hr>
                        <div class="text-center">
                            <button type="button" class="btn btn-success btn-block my-1" data-bs-toggle="modal" data-bs-target="#registro">Registrarse</button>
                        </div>
                    
                </div>
            </div>
        </div>
        
        <div class="container" style="padding-top:100px;">
            <div class="card-header my-3">Todos los productos</div>
            <div class="row">
                <%
                    if(!listaProductos.isEmpty()){
                        for(Producto p: listaProductos){%>
                        <div class="col-md-3 my-3">
                            <div class="card w-100" style="width: 18rem;">
                                <img class="card-img-top" src="<%= p.getImagen() %>" alt="imagen">
                                <div class="card-body">
                                    <h5 class="card-title"><%= p.getNombre() %></h5>
                                    <h6>Precio: $<%= p.getPrecio() %></h6>
                                    <div class="mt-3 d-flex justify-content-between">
                                        <form action="agregarCarrito?tarea=agregarCarrito" method="POST">
                                            <input type="hidden" name="id" value="<%= p.getId() %>" />
                                            <input type="hidden" name="total" value="<%= p.getPrecio()%>" />
                                            <% if(cliente == null){ %>
                                                <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="offcanvas" data-bs-target="#demo">Agregar al carrito</button>
                                            <% } else { %>
                                                <button type="submit" class="btn btn-primary btn-sm">Agregar al carrito</button>
                                            <% } %>
                                        </form>
<!--                                        <a href="#" class="btn btn-primary btn-sm">Comprar ahora</a>-->
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    <%}
                }
            %>
            </div>
        </div>
        
    </body>
</html>
