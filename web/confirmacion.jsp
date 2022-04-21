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
            if (null == cliente) {
                response.sendRedirect("index.jsp");
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
                    <h1>¡Tu pedido se ha realizado con exito!</h1>
                    <h5 class="mb-5">Los datos para la transeferencia bancaria son los siguientes:</h5>
                    <h5 class="mb-5" style="color:red"><\Insertar datos bancarios aquí\></h5>
                    <br>
                    <h5 class="mb-5">Tu pedido será enviado en cuanto se realize el pago correspondiente.</h5>
                    
                    <!--<small>El navegador te rediccionar&aacute; autom&aacute;ticamente</small>-->
                </div>
            </div>
        </div>
    </body>
</html>
