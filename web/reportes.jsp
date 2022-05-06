<%-- 
    Document   : reportes
    Created on : 30/04/2022, 06:02:35 PM
    Author     : Andrea
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
        <title>Generacion de reportes</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://kit.fontawesome.com/c7d94c22d4.js" crossorigin="anonymous"></script>
        
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>

    <body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="50">

        <%@include file="jspf/navbar_negocio.jspf"%>

        <div class="container-fluid m-0 px-0" style="padding-top:100px;">
            <div class="row">
                <div class="col-sm-3"></div>
                <div class="col">
                    <section>
                        <div>
                            <h1>Generar Reportes</h1>
                            <p>Seleccione las fechas para generar el reporte, inicio de fecha y la fecha final respectivamente. El periodo por defecto es de un mes.</p>
                            <br>

                            <form action="consultarPedidos" method="POST">
                                <h5>Selecciona el inicio del periodo</h5>
                                <input class="mb-3" id="fechainicio" name="fechainicio" type="date" min="2022-01-01">
                                <h5>Selecciona el fin del periodo</h5>
                                <input id="fechafin" name="fechafin" type="date" min="2022-01-01">
                                

                                <div class="text-end">
                                    <br>
                                    <button type="submit" class="btn btn-primary mb-5">Buscar pedidos</button>
                                </div>
                            </form>
                        </div>
                    </section>
                </div>
                <div class="col-sm-3"></div>
            </div>
        </div>
        
        <%-- JavaScript para el cálculo de fechas !--%>
        <script>
            function subtractMonths(numOfMonths, date = new Date()) {
                date.setMonth(date.getMonth() - numOfMonths);

                return date;
            }
            document.getElementById("fechainicio").value = subtractMonths(1).toISOString().slice(0,10);
            document.getElementById("fechafin").value = new Date().toISOString().slice(0,10);
        </script>
    </body>
</html>
