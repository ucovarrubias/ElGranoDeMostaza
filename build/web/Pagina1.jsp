<%-- 
    Document   : Pagina1
    Created on : 1 may. 2022, 13:47:58
    Author     : Erwing
--%>


<%@page import="controlador.ImagenDAO"%>
<%@page import="VO.ImagenVO"%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<%-- Incluye la barra de navegación --%>
        
        <div class="container-fluid m-0 px-0" style="padding-top:80px;">
            <nav class="navbar navbar-expand-sm bg-none justify-content-center mb-2">
                <h5 class="h5 px-3"><a href="home.jsp" style=" text-decoration: none; color: inherit;"><i class="fa-solid fa-chevron-left"></i> Regreso</a></h5>
             </nav>
    <%
        ImagenDAO emp = new ImagenDAO();
        ImagenVO imgvo = new ImagenVO();
        ArrayList<ImagenVO> listar = emp.Listar_ImagenVO();
    %>
    <center><a id="mostrar" href="ControllerImagen?action=insert&id=<%=imgvo.getCodigoimg()%>"> <img src="images/nuevo.png" title="Nuevo registro"/></a></center><br>
    <div class="datagrid">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Folio</th>
                    <th>Imagen</th>
                    <th></th>
                </tr>
            </thead>
            <tfoot>
                <tr>
                    <td colspan="4">
                        <div id="paging"><ul><li><a href="#"><span>Previous</span></a></li><li><a href="#" class="active"><span>1</span></a></li><li><a href="#"><span>2</span></a></li><li><a href="#"><span>3</span></a></li><li><a href="#"><span>4</span></a></li><li><a href="#"><span>5</span></a></li><li><a href="#"><span>Next</span></a></li></ul>
                        </div>
                </tr>
            </tfoot>
            <tbody>
                <%if (listar.size() > 0) {
                        for (ImagenVO listar2 : listar) {
                            imgvo = listar2;
                %>
                <tr>
                    <td><%=imgvo.getCodigoimg()%></td>
                    <td><%=imgvo.getNombreimg()%></td>
                    <td>
                        <%
                            if (imgvo.getArchivoimg2() != null) {
                        %>
                        <a href="imagen?id=<%=imgvo.getCodigoimg() %>" target="_blank"><img src="images/imagen.png" title="imagen"/> 
                        <%
                            } else {
                                out.print("No disponible");
                            }
                        %>
                    </td>
                  
                    <td>
                        <!--<a id="mostrar" href="ControllerImagen?action=insert&id=<%=imgvo.getCodigoimg()%>"> <img src="images/nuevo.png" title="Nuevo registro"/></a>--->
                        <a href="ControllerImagen?action=edit&id=<%=imgvo.getCodigoimg()%>"> <img src="images/editar.png" title="Modificar"/></a>
                        <!--<a href="ControllerImagen?action=delete&id=<%=imgvo.getCodigoimg()%>"> <img src="images/delete.png" title="Eliminar"/></a>-->
                    </td>
                </tr>
                <%}
                    }%>
                    
            </tbody>
        </table>
       
    </div>
                    
</body>
</html>
