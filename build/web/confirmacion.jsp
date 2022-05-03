<%-- 
    Document   : confirmacion
    Created on : Dec 6, 2021, 11:39:38 PM
    Author     : ucova
--%>

<%@page import="modelo.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <%
            Cliente cliente = (Cliente) session.getAttribute("cliente");
            String totalPedido = null;
            String folio = null;
            if (null == cliente) {
                response.sendRedirect("index.jsp");
            } else {
                totalPedido = (String) request.getAttribute("totalPedido");
                folio = (String) request.getAttribute("folio");
            }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/c7d94c22d4.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <title>Tu pedido se ha realizado con exito</title>
        
        <!--
        <script>
            window.setTimeout(function(){
                window.location.href = "index.jsp";
            }, 5000);
        </script>
        -->
    </head>
    <body>
        <div class="container mt-5">
            <div class="row">
                <div class="col text-center">
                    <img src="images/logo.png" alt="Logo" style="width:100px;" class="pill">
                    <h1 class="mb-5">¡Tu pedido se ha realizado con exito!</h1>
                    <h5>Tu pedido generó el siguiente folio:</h5>
                    <h4><%= folio %></h4>
                    <p>El folio será necesario para registrar tu pago desde tu cuenta.</p>
                    <br>
                    <h5 class="mb-5">Los datos para la transeferencia bancaria son los siguientes:</h5>
                    <h4>Número de cuenta CLABE</h4>
                    <h4>1277 6701 3318 8922 81</h4>
                    <br>
                    <h4>Total a depositar:</h4>
                    <h4>$<%= totalPedido %></h4>
                    <br>
                    <h5 class="mb-5">Tu pedido será enviado en cuanto se realize el pago correspondiente.</h5>
                    
                    <!--<small>El navegador te rediccionar&aacute; autom&aacute;ticamente</small>-->
                    <button class="btn btn-primary" onclick="document.location='index.jsp'">Regresar al Inicio</button>
                </div>
            </div>
        </div>
    </body>
</html>
