<%-- 
    Document   : productos
    Author     : rene
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
        
        <link rel="stylesheet" href="css/jquery-ui-1.10.3.custom.min.css">
        <link rel="stylesheet" href="css/font-icons/entypo/css/entypo.css">
        <!--<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Noto+Sans:400,700,400italic">-->
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/neon-core.css">
        <link rel="stylesheet" href="css/neon-theme.css">
        <link rel="stylesheet" href="css/neon-forms.css">
        <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
        <!--Combo-->
        <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.10.3.custom.css">
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
            <div class="card-header my-3">Recuperar pedidos</div>
            <div class="panel-body">

                            <form  action="Fecha" role="form" id="data" method="post" class="validate form-groups-bordered">

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="control-label">Fecha Inicio</label>
                                        <div class="date-and-time">
                                            <input type="text" name="inicio" class="form-control datepicker" >
                                            <input type="text" name="iniciohora" class="form-control timepicker" data-template="dropdown" data-show-seconds="true" data-default-time="08:00 AM" data-show-meridian="false" data-minute-step="1" data-second-step="1" />
                                        </div>
                                    </div>

                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="control-label">Fecha Fin</label>
                                        <div class="date-and-time">
                                            <input type="text" name="fin" class="form-control datepicker">
                                            <input type="text" name="finhora" class="form-control timepicker" data-template="dropdown" data-show-seconds="true" data-default-time="08:00 AM" data-show-meridian="false" data-minute-step="1" data-second-step="1" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-sm-12">
                                    <button type="submit" class="btn btn-success">Buscar</button>
                                    <button type="reset" class="btn">Reset</button>
                                </div>
                                <input type="hidden" id="action" name="action" value="registro">
                            </form>
                            <!-- start project list -->
                            <table class="table table-bordered table-hover projects">
                                <thead>
                                    <tr>
                                        <th>Cliente</th>
                                        <th>Fecha</th>
                                        <th>Total</th>
                                        <th style="width: 20%">#Edit</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${Pedido}" var="user">
                                    <tr>
                                        <td>${Pedido}</td>
                                        <td>${Pedido}</td>
                                        <td>${Pedido}</td>
                                        <td>
                                            <a href="#" class="btn btn-primary btn-xs"><i class="entypo-info"></i> Ver </a>
                                            <a href="#" class="btn btn-info btn-xs"><i class="entypo-pencil"></i> Editar </a>
                                            <a href="Fecha?action=eliminar&codigo=${user.codigo}" class="btn btn-danger btn-xs"><i class="entypo-cancel"></i> Borrar  </a>

                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <!-- end project list -->

                    </div>
                </div>
        </div>
        <!-- Bottom scripts (common) -->
        <script src="js/TweenMax.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/resizeable.js"></script>
        <script src="js/neon-api.js"></script>

        <!-- Select2-->
        <script src="js/neon-chat.js"></script>
        <script src="js/jquery.selectBoxIt.min.js"></script>
        <%--FECHA--%>
        <!-- Imported scripts on this page -->
        <script src="js/bootstrap-datepicker.js"></script> 
        <script src="js/bootstrap-timepicker.min.js"></script>
        <!-- JavaScripts initializations and stuff -->
        <script src="js/neon-custom.js"></script>
        
        <!-- Demo Settings -->
        <script src="js/neon-demo.js"></script>
    </body>
</html>
