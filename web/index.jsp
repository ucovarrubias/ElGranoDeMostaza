<%-- 
    Document   : index
    Created on : Nov 24, 2021, 8:10:29 PM
    Author     : ucova
--%>

<%@page import="modelo.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <!-- Fondo -->
        <div id="inicio" class="hero-image">
            <div class="hero-text">
                <h1 id="titulo">El Grano de Mostaza</h1>
                <p id="subtitulo">Centro naturista y temazcal</p>
                <button class="btn btn-success" onclick="document.location='productos.jsp'">Ver productos</button>
            </div>
        </div>
        
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
        
        <!-- The Modal -->
        <div class="modal" id="registro">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Crear nueva cuenta</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="registrarCliente" method="POST">
                            <!-- Usuario -->
                            <input type="text" maxlength="20" 
                                   pattern="[a-zA-Z0-9_]{5,20}"
                                   title="El nombre de usuario debe ser mayor a 5 y menor a 20 caracteres, sin caracteres especiales."
                                   class="form-control mb-2" id="reg_usuario" placeholder="Usuario" name="reg_usuario" required>
                            
                            <!-- Nombre -->
                            <input type="text" maxlength="20" 
                                   pattern="[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]{5,50}"
                                   title="El nombre debe ser mayor a 3 y menor a 20 caracteres, sin d&iacute;gitos."
                                   class="form-control mb-2" id="nombre" placeholder="Nombre" name="nombre" required>
                            
                            <!-- Apellido -->
                            <input type="text" maxlength="50" 
                                   pattern="[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]{5,50}"
                                   title="El apellido debe ser mayor a 3 y menor a 20 caracteres, sin d&iacute;gitos."
                                   class="form-control mb-2" id="apellido" placeholder="Apellido" name="apellido" required>
                            
                            <!-- Email -->
                            <input type="email" maxlength="50" 
                                   title="Favor de introducir un correo v&aa&aacute;lido"
                                   class="form-control mb-2" id="email" placeholder="Correo electr&oacute;nico" name="email" required>
                            
                            <!-- Contraseña -->
                            <input type="password" maxlength="15" pattern="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\S+$).{6,}$"
                                   title="La contraseña debe ser mayor a 6 caracteres y debe incluir por lo menos una mayúscula y un d&iacute;gito. M&aacute;ximo 15 caracteres."
                                   class="form-control mb-2" id="reg_contrasenia" placeholder="Contrase&ntilde;a" name="reg_contrasenia" required>
                            
                            <!-- Confirmar contraseña -->
                            <input type="password" maxlength="15" pattern="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\S+$).{6,}$"
                                   title="La contraseña debe ser mayor a 6 caracteres y debe incluir por lo menos una mayúscula y un d&iacute;gito. M&aacute;ximo 15 caracteres."
                                   class="form-control mb-2" id="reg_confirmar_contrasenia" placeholder="Confirmar contrase&ntilde;a" name="reg_confirmar_contrasenia" required>
                            
                            <!-- Calle -->
                            <input type="text" maxlength="20" 
                                   pattern="[a-zA-Z0-9àáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]{5,20}"
                                   title="La calle debe ser m&iacute;nimo 5 caracteres, máximo 20."
                                   class="form-control mb-2" id="calle" placeholder="Calle" name="calle" required>
                            
                            <!-- Número -->
                            <input type="text" maxlength="5" 
                                   pattern="^[a-zA-Z0-9-]*$"
                                   class="form-control mb-2" id="numero" placeholder="N&uacute;mero" name="numero" required>
                            
                            <!-- Código Postal -->
                            <input type="text" maxlength="5" 
                                   pattern="[0-9]{5}"
                                   title="El c&oacute;digo postal debe contener s&oacute;lo 5 n&uacute;meros."
                                   class="form-control mb-2" id="codpostal" placeholder="C&oacute;digo Postal" name="codpostal" required>
                            
                            <!-- Ciudad -->
                            <input type="text" maxlength="30" 
                                   pattern="[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]{5,30}"
                                   title="La ciudad debe ser mayor a 5 caracteres, m&aacute;ximo 30."
                                   class="form-control mb-2" id="ciudad" placeholder="Ciudad" name="ciudad" required>
                            
                            <!-- Estado -->
                            <input type="text" maxlength="30" 
                                   pattern="[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]{5,30}"
                                   title="El estado debe ser mayor a 5 caracteres, m&aacute;ximo 30."
                                   class="form-control mb-2" id="estado" placeholder="Estado" name="estado" required>
                            
                            <!-- País -->
                            <input type="text" maxlength="30" 
                                   pattern="[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]{5,30}"
                                   title="El pa&iacute;s debe ser mayor a 5 caracteres, m&aacute;ximo 30."
                                   class="form-control mb-2" id="pais" placeholder="Pa&iacute;s" name="pais" required>
                            
                            <!-- Teléfono -->
                            <input type="tel" pattern="[0-9]{10}" 
                                   title="El número de telefóno debe ser a 10 dígitos."
                                   class="form-control mb-2" id="telefono" placeholder="Tel&eacute;fono" name="telefono" required>
                            
                            <!-- Modal footer -->
                            <div class="modal-footer justify-content-center mt-4">
                                <button type="submit" class="btn btn-success">Registrarse</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        
        <!-- Servicios -->
        <div id="servicios" class="container-fluid mt-5 scrollspie" style="padding:100px 20px;">
            <h1 class="text-center">Servicios</h1><br>
            <div class="row">
                <div class="col-sm-2"></div>
                <div class="col-sm-4">
                    <div>
                        <h3>Temazcal</h3>
                        <p>El temazcal es un baño de vapor que se ha utilizado 
                            ampliamente en Mesoamérica desde hace milenios, con
                            propósitos medicinales de desintoxicación por 
                            sudoración por las infusiones de hierbas.</p>
                    </div>
                    <div>
                        <h3>Iridolog&iacute;a</h3>
                        <p>Examen realizado por computadora para determinar 
                            información sobre la salud sistémica de un paciente 
                            examinando los patrones, colores y otras 
                            características del iris del ojo.</p>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div>
                        <h3>Naturopat&iacute;a</h3>
                        <p>Significa “curación natural” y comprende modalidades 
                            terapéuticas que guían al cuerpo humano hacia su 
                            estado original de equilibrio. Sobre todo, trata de 
                            estimular las capacidades de autocuración y 
                            recuperación de cada persona. </p>
                    </div>
                    <div>
                        <h3>Homeopat&iacute;a</h3>
                        <p>Creado en 1796 por Samuel Hahnemann basado en su 
                            doctrina de «lo similar cura lo similar», que 
                            sostiene que una sustancia que causa los síntomas de
                            una enfermedad en personas sanas curará lo similar 
                            en personas enfermas.</p>
                    </div>
                </div>
                <div class="col-sm-2"></div>
            </div>
        </div>
        
        <!-- Sobre nosotros -->
        <div id="nosotros" class="container-fluid mt-5 bg-light" style="padding:100px 20px;">
            <div class="row ">
                <div class="col-sm-2"></div>
                <div class="col-sm-4">
                    <h1>Sobre nosotros</h1><br>    
                    <p>Después de que el médico Juventino Covarrubias Rodríguez 
                        realizó sus estudios universitarios en México como 
                        médico homeópata naturista y viendo la necesidad de la 
                        gente de una desintoxicación profunda para curar sus 
                        enfermedades y habiendo recibido instrucción y el legado
                        de la terapia del temazcal decidió construir un temazcal
                        para ayudar a la curación de todas las enfermedades 
                        incluyendo las catalogadas incurables.</p>
                    <p>Se construyó en Providencia, Sonora desde hace 27 años 
                        dónde también instaló su consultorio médico y se decidió
                        poner el nombre del “El Grano de Mostaza” haciendo 
                        alusión a que el paciente cuando tenga fe de curarse 
                        creyendo que así sucederá su recuperación será más 
                        rápido y posible.</p>
                    <p class="display-6">Misi&oacute;n</p>
                    <p>Ofrecer el servicio del Temazcal para ayudar a recuperar 
                        la salud física, emocional y espiritual para todas las 
                        edades de ambos sexos, especialmente para atender 
                        enfermedades degenerativas (pie diabetico, lupus, asma, 
                        c&aacute;ncer, angina de pecho, fibromialgía, artritis, 
                        entre otros).</p>
                    <p class="display-6">Visi&oacute;n</p>
                    <p>Poder llegar a todas las comunidades de Estado de Sonora,
                        a los sectores públicos y privados, y dar a conocer que 
                        sí hay curación para todas las enfermedades a través del
                        tratamiento de la medicina alternativa (Naturópata, 
                        Homeopatía y la terapia del Temazcal).</p>
                </div>
                <div class="col-sm-4">
                    <img class="img-fluid" src="images/doctor.jpg" alt="doctor" width="500">
                </div>
                <div class="col-sm-2"></div>
            </div>
        </div>
        
        <!-- Contacto -->
        <div id="contacto" class="container mt-5">
            <div class="row">
                <div class="col">
                    <h1>Cont&aacute;ctanos</h1>
                    <form action="/action_page.php">
                        <div class="mb-3 mt-3">
                            <label for="name">Nombre completo</label>
                            <input type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Nombre completo" required>
                        </div>
                        <div class="mb-3">
                            <label for="email">Correo electr&oacute;nico</label>
                            <input type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Correo electr&oacute;nico" required>
                            <small id="emailHelp" class="form-text text-muted">Nunca compartiremos su informaci&oacute;n con nadie m&aacute;s.</small>
                        </div>
                        <div class="mb-3">
                            <label for="message">Mensaje</label>
                            <textarea class="form-control" id="message" rows="6" required></textarea>
                        </div>
                        <div class="mx-auto">
                            <button type="submit" class="btn btn-primary text-right">Enviar</button>
                        </div>
                    </form>
                </div>
                <div class="col">
                    <div class="mapouter">
                        <div class="gmap_canvas">
                            <iframe width="600" height="500" id="gmap_canvas" 
                                    src="https://maps.google.com/maps?q=El%20Grano%20De%20Mostaza%20y%20Temazcal&t=&z=13&ie=UTF8&iwloc=&output=embed" 
                                    frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
                            <a href="https://www.embedgooglemap.net">map embed iframe</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <div class="mt-5 p-4 bg-dark text-white text-center">
            <p>Todos los derechos reservados</p>
        </div>
        
        <script>
            var password = document.getElementById("reg_contrasenia"), confirm_password = document.getElementById("reg_confirmar_contrasenia");

            function validatePassword(){
                if(password.value != confirm_password.value) {
                    confirm_password.setCustomValidity("Las contraseñas no coinciden");
                } else {
                    confirm_password.setCustomValidity('');
                }
            }
            password.onchange = validatePassword;
            confirm_password.onkeyup = validatePassword;
        </script>
    </body>
</html>
