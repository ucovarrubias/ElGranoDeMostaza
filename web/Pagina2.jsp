<%-- 
    Document   : Pagina2
    Created on : 30/05/2022, 04:00:50 PM
    Author     : Rene
--%>

<%@page import="VO.ImagenVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style2.css" type="text/css" media="screen"/>
        <title>Subir Imagen</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/c7d94c22d4.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <%
            Integer dato = 0;
            try {
                ImagenVO img = (ImagenVO) request.getAttribute("row");
                dato = img.getCodigoimg();
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
            boolean icono = false;
            try {
                icono = (Boolean) request.getAttribute("row2");
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
        %>


        <form name="formimg" action="ControllerImagen" method="post" enctype="multipart/form-data">
            <div class="datagrid">
                <table>
                    <thead>
                        <tr>
                            <th>Folio</th>
                            <th>Campo</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <td colspan="2">

                            </td>
                        </tr>
                    </tfoot>
                    <tbody>
                        <tr>
                            <td><label for="id">Folio del archivo: </label>
                            </td>  
                            <td>
                                <input type="text" name="txtname" value="<c:out value="${row.nombreimg}" />"/>
                            </td>
                        </tr>
                        <tr class="alt">
                            <td>
                                <label for="id">Seleccionar Imagen: *</label> 
                                <%
                                    if (icono) {
                                %>
                                <a href="imagen?id=<%out.print(dato); %>" target="_blank"> Ver Imagen</a>
                                <%
                                    } else {
                                        out.print("Sin Imagen");
                                    }
                                %>
                            </td>  
                            <td>
                                <input type="file" name="fichero" value="" id="btn" class="btn" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center"><input type="submit" value="Enviar Archivo" name="submit" id="btn" class="btn"/></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </form>
        <h5 class="h5 px-3"><a href="Pagina1.jsp" style=" text-decoration: none; color: inherit;"><i class="fa-solid fa-chevron-left"></i> Regresar</a></h5>
    </body>
</html>
