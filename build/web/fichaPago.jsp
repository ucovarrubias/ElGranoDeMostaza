<%-- 
    Document   : Pagina1
    Created on : 19/12/2017, 03:29:08 PM
    Author     : David
--%>

<%@page import="VO.ImagenVO"%>
<%@page import="DAO.ImagenDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen"/>
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <h1>Imagenes Turisticas</h1>
    </center>

    <%
        ImagenDAO emp = new ImagenDAO();
        ImagenVO imgvo = new ImagenVO();
        ArrayList<ImagenVO> listar = emp.Listar_ImagenVO();
    %>

    <div class="datagrid">
        <table>
            <thead>
                <tr>
                    <th>Codigo</th>
                    <th>Nombre</th>
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
                        <a href="imagen?id=<%=imgvo.getCodigoimg() %>" target="_blank"><img src="Imagen/imagen.png" title="imagen"/> 
                        <%
                            } else {
                                out.print("No disponible");
                            }
                        %>
                    </td>
                    <td>
                        <a id="mostrar" href="ControllerImagen?action=insert&id=<%=imgvo.getCodigoimg()%>"> <img src="Imagen/nuevo.png" title="Nuevo registro"/></a>-
                        <a href="ControllerImagen?action=edit&id=<%=imgvo.getCodigoimg()%>"> <img src="Imagen/editar.png" title="Modificar"/></a>-
                        <a href="ControllerImagen?action=delete&id=<%=imgvo.getCodigoimg()%>"> <img src="Imagen/delete.png" title="Eliminar"/></a>
                    </td>
                </tr>
                <%}
                    }%>
            </tbody>
        </table>
    </div>

</body>
</html>
