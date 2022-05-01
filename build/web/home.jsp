<%-- 
    Document   : home
    Created on : Nov 25, 2021, 2:48:03 AM
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
        <title>Perfil de cliente</title>
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
                <h5 class="h5 px-3"><i class="fa-solid fa-circle-user"></i> Mi perfil</h5>
                <h5 class="h5 px-3"><a href="buscarPedidos" style=" text-decoration: none; color: inherit;"><i class="fa-solid fa-box"></i> Mis pedidos</a></h5>
             </nav>
            <div class="row">
                <div class="col-sm-3"></div>
                <div class="col-sm-6">
                <h1>¡Bienvenido! ${cliente.usuario}</h1>
                    <div>
                        <p>Los detalles de tu cuenta son los siguientes:</p>
                        <table class="table">
                            <tr>
                                <td>Usuario: </td>
                                <td>${cliente.usuario}</td>
                                <td><a data-bs-toggle="modal" data-bs-target="#cambiarUsuario" href="#"><i class="fas fa-chevron-right"></i></a></td>
                            </tr>
                            <tr>
                                <td>Correo electr&oacute;nico: </td>
                                <td>${cliente.email}</td>
                                <td><a data-bs-toggle="modal" data-bs-target="#cambiarEmail" href="#"><i class="fas fa-chevron-right"></i></a></td>
                            </tr>
                            <tr>
                                <td>Nombre: </td>
                                <td>${cliente.nombre}</td>
                                <td><a data-bs-toggle="modal" data-bs-target="#cambiarNombre" href="#"><i class="fas fa-chevron-right"></i></a></td>
                            </tr>
                            <tr>
                                <td>Nombre: </td>
                                <td>${cliente.apellido}</td>
                                <td><a data-bs-toggle="modal" data-bs-target="#cambiarApellido" href="#"><i class="fas fa-chevron-right"></i></a></td>
                            </tr>
                            <tr>
                                <td>Calle: </td>
                                <td>${direccion.calle}</td>
                                <td><a data-bs-toggle="modal" data-bs-target="#cambiarCalle" href="#"><i class="fas fa-chevron-right"></i></a></td>
                            </tr>
                            <tr>
                                <td>N&uacute;mero exterior: </td>
                                <td>${direccion.numExterior}</td>
                                <td><a data-bs-toggle="modal" data-bs-target="#cambiarNumExterior" href="#"><i class="fas fa-chevron-right"></i></a></td>
                            </tr>
                            <tr>
                                <td>C&oacute;digo postal: </td>
                                <td>${direccion.codigoPostal}</td>
                                <td><a data-bs-toggle="modal" data-bs-target="#cambiarCodigoPostal" href="#"><i class="fas fa-chevron-right"></i></a></td>
                            </tr>
                            <tr>
                                <td>Ciudad: </td>
                                <td>${direccion.ciudad}</td>
                                <td><a data-bs-toggle="modal" data-bs-target="#cambiarCiudad" href="#"><i class="fas fa-chevron-right"></i></a></td>
                            </tr>
                            <tr>
                                <td>Estado:</td>
                                <td>${direccion.estado}</td>
                                <td><a data-bs-toggle="modal" data-bs-target="#cambiarEstado" href="#"><i class="fas fa-chevron-right"></i></a></td>
                            </tr>
                            <tr>
                                <td>Pa&iacute;s: </td>
                                <td>${direccion.pais}</td>
                                <td><a data-bs-toggle="modal" data-bs-target="#cambiarPais" href="#"><i class="fas fa-chevron-right"></i></a></td>
                            </tr>
                            <tr>
                                <td>Tel&eacute;fono: </td>
                                <td>${cliente.telefono}</td>
                                <td><a data-bs-toggle="modal" data-bs-target="#cambiarTelefono" href="#"><i class="fas fa-chevron-right"></i></a></td>
                            </tr>
                        </table>
                        <div class="d-flex justify-content-between">
                            <small><a class="text-info" href="cerrarSesion" style="text-decoration: none;">Cerrar sesi&oacute;n</a></small>
                            <small><a class="text-danger" data-bs-toggle="modal" data-bs-target="#eliminarCuenta" href="#" style="text-decoration: none;">Eliminar cuenta</a></small>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    
                </div>
            </div>
        </div>
        
        <!-- Modal usuario -->
        <div class="modal fade" id="cambiarUsuario">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Modificar usuario</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <form action="actualizarCliente?tarea=actualizarUsuario" method="POST">
                        <small>Usuario</small>
                        <input type="text" class="form-control mb-2" id="usuario" placeholder="Usuario" name="usuario" value="${cliente.usuario}" required>
                        <div class="mt-5">
                            <button type="submit" class="btn btn-primary btn-lg" data-bs-dismiss="modal">Guardar</button>
                            <button type="button" class="btn btn-light btn-lg" data-bs-dismiss="modal">Cancelar</button>
                        </div>
                    </form>
                </div>
            </div>
          </div>
        </div>
                                
        <!-- Modal email -->
        <div class="modal fade" id="cambiarEmail">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Modificar email</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <form action="actualizarCliente?tarea=actualizarEmail" method="POST">
                        <small>Email</small>
                        <input type="text" class="form-control mb-2" id="email" placeholder="Correo electr&oacute;nico" name="email" value="${cliente.email}" required>
                        <div class="mt-5">
                            <button type="submit" class="btn btn-primary btn-lg" data-bs-dismiss="modal">Guardar</button>
                            <button type="button" class="btn btn-light btn-lg" data-bs-dismiss="modal">Cancelar</button>
                        </div>
                    </form>
                </div>
            </div>
          </div>
        </div>                    
        
        <!-- Modal nombre -->
        <div class="modal fade" id="cambiarNombre">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Modificar nombre</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <form action="actualizarCliente?tarea=actualizarNombre" method="POST">
                        <small>Nombre</small>
                        <input type="text" class="form-control mb-2" id="nombre" placeholder="Nombre" name="nombre" value="${cliente.nombre}" required>
                        <div class="mt-5">
                            <button type="submit" class="btn btn-primary btn-lg" data-bs-dismiss="modal">Guardar</button>
                            <button type="button" class="btn btn-light btn-lg" data-bs-dismiss="modal">Cancelar</button>
                        </div>
                    </form>
                </div>
            </div>
          </div>
        </div>
                        
        <!-- Modal apellido -->
        <div class="modal fade" id="cambiarApellido">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Modificar apellido</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <form action="actualizarCliente?tarea=actualizarApellido" method="POST">
                        <small>Apellido</small>
                        <input type="text" class="form-control mb-2" id="apellido" placeholder="Apellido" name="apellido" value="${cliente.apellido}" required>
                        <div class="mt-5">
                            <button type="submit" class="btn btn-primary btn-lg" data-bs-dismiss="modal">Guardar</button>
                            <button type="button" class="btn btn-light btn-lg" data-bs-dismiss="modal">Cancelar</button>
                        </div>
                    </form>
                </div>
            </div>
          </div>
        </div>
                       
        <!-- Modal calle -->
        <div class="modal fade" id="cambiarCalle">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Modificar calle</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="actualizarCliente?tarea=actualizarCalle" method="POST">
                            <small>Calle</small>
                            <input type="text" class="form-control mb-2" id="calle" placeholder="Calle" name="calle" value="${direccion.calle}" required>
                            <div class="mt-5">
                                <button type="submit" class="btn btn-primary btn-lg" data-bs-dismiss="modal">Guardar</button>
                                <button type="button" class="btn btn-light btn-lg" data-bs-dismiss="modal">Cancelar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
                            
        <!-- Modal número exterior -->
        <div class="modal fade" id="cambiarNumExterior">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Modificar n&uacute;mero exterior</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="actualizarCliente?tarea=actualizarNumExterior" method="POST">
                            <small>N&uacute;mero exterior</small>
                            <input type="text" class="form-control mb-2" id="numExterior" placeholder="NumExterior" name="numExterior" value="${direccion.numExterior}" required>
                            <div class="mt-5">
                                <button type="submit" class="btn btn-primary btn-lg" data-bs-dismiss="modal">Guardar</button>
                                <button type="button" class="btn btn-light btn-lg" data-bs-dismiss="modal">Cancelar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
                            
        <!-- Modal código postal -->
        <div class="modal fade" id="cambiarCodigoPostal">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Modificar c&oacute;digo postal</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="actualizarCliente?tarea=actualizarCodigoPostal" method="POST">
                            <small>C&oacute;digo postal</small>
                            <input type="text" class="form-control mb-2" id="codigoPostal" placeholder="CodigoPostal" name="codigoPostal" value="${direccion.codigoPostal}" required>
                            <div class="mt-5">
                                <button type="submit" class="btn btn-primary btn-lg" data-bs-dismiss="modal">Guardar</button>
                                <button type="button" class="btn btn-light btn-lg" data-bs-dismiss="modal">Cancelar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
                            
        <!-- Modal ciudad -->
        <div class="modal fade" id="cambiarCiudad">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Modificar ciudad</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="actualizarCliente?tarea=actualizarCiudad" method="POST">
                            <small>Ciudad</small>
                            <input type="text" class="form-control mb-2" id="ciudad" placeholder="Ciudad" name="ciudad" value="${direccion.ciudad}" required>
                            <div class="mt-5">
                                <button type="submit" class="btn btn-primary btn-lg" data-bs-dismiss="modal">Guardar</button>
                                <button type="button" class="btn btn-light btn-lg" data-bs-dismiss="modal">Cancelar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
                            
        <!-- Modal estado -->
        <div class="modal fade" id="cambiarEstado">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Modificar estado</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="actualizarCliente?tarea=actualizarEstado" method="POST">
                            <small>Estado</small>
                            <input type="text" class="form-control mb-2" id="estado" placeholder="Estado" name="estado" value="${direccion.estado}" required>
                            <div class="mt-5">
                                <button type="submit" class="btn btn-primary btn-lg" data-bs-dismiss="modal">Guardar</button>
                                <button type="button" class="btn btn-light btn-lg" data-bs-dismiss="modal">Cancelar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
                            
        <!-- Modal país -->
        <div class="modal fade" id="cambiarPais">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Modificar pa&iacute;s</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="actualizarCliente?tarea=actualizarPais" method="POST">
                            <small>Pa&iacute;s</small>
                            <input type="text" class="form-control mb-2" id="pais" placeholder="Pais" name="pais" value="${direccion.pais}" required>
                            <div class="mt-5">
                                <button type="submit" class="btn btn-primary btn-lg" data-bs-dismiss="modal">Guardar</button>
                                <button type="button" class="btn btn-light btn-lg" data-bs-dismiss="modal">Cancelar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
                            
        <!-- Modal teléfono -->
        <div class="modal fade" id="cambiarTelefono">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Modificar tel&eacute;fono</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="actualizarCliente?tarea=actualizarTelefono" method="POST">
                            <small>Tel&eacute;fono</small>
                            <input type="text" class="form-control mb-2" id="telefono" placeholder="Tel&eacute;fono" name="telefono" value="${cliente.telefono}" required>
                            <div class="mt-5">
                                <button type="submit" class="btn btn-primary btn-lg" data-bs-dismiss="modal">Guardar</button>
                                <button type="button" class="btn btn-light btn-lg" data-bs-dismiss="modal">Cancelar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
                            
        <!-- Modal eliminar cuenta -->
        <div class="modal fade" id="eliminarCuenta">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title text-danger">¡Advertencia!</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="eliminarCliente" method="POST">
                            <p>¿Est&aacute; seguro de realizar esta acci&oacute;n?</p>
                            <div class="mt-5">
                                <button type="submit" class="btn btn-danger btn-lg" data-bs-dismiss="modal">Confirmar</button>
                                <button type="button" class="btn btn-light btn-lg" data-bs-dismiss="modal">Cancelar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
                        
    </body>
</html>
