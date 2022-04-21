<%-- 
    Document   : pedido
    Created on : Dec 6, 2021, 10:52:30 PM
    Author     : ucova
--%>

<%@page import="modelo.Direccion"%>
<%@page import="modelo.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            Cliente cliente = (Cliente) session.getAttribute("cliente");
            if (null == cliente) {
                response.sendRedirect("index.jsp");
            } else {
                Direccion direccion = (Direccion) session.getAttribute("direccion");
            }
        %>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/c7d94c22d4.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <title>Selecciona una dirección de envío</title>
    </head>
    <body>
        <div class="container">
            <h1 class="mt-5">Selecciona una dirección de envío</h1>
            <div class="row">
                <div class="col">
                    <table class="table">
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
                
                    <button class="btn btn-warning" onclick="document.location='pago.jsp'">Entregar a esta direcci&oacute;n</button>
                </div>
                <div class="col"></div>
                <div class="col"></div>
            </div>
        </div>
    </body>
</html>
