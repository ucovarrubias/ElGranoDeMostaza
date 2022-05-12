<%-- 
    Document   : Pagina1
    Created on : 1 may. 2022, 13:47:58
    Author     : Erwing
--%>


<%@page import="modelo.Admin"%>
<%@page import="controlador.ImagenDAO"%>
<%@page import="VO.ImagenVO"%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            Admin admin = (Admin) session.getAttribute("admin");
            if (null == admin) {
                response.sendRedirect("index.jsp");
            }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style2.css" type="text/css" media="screen"/>
        <title>Subir Imagen</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/c7d94c22d4.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="50">
        
        <%@include file="jspf/navbar_negocio.jspf"%>
        
        <div class="container" style="padding-top:100px;">
            <div class="row">
                <div class="col-sm-12">
                    <h1>Consulta de pagos de pedidos</h1>
    <%
        ImagenDAO emp = new ImagenDAO();
        ImagenVO imgvo = new ImagenVO();
        ArrayList<ImagenVO> listar = emp.Listar_ImagenVO();
    %>

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
                        <div id="paging">
                            <ul>
                                <li><a href="#"><span>Previous</span></a></li>
                                <li><a href="#" class="active"><span>1</span></a></li>
                                <li><a href="#"><span>2</span></a></li>
                                <li><a href="#"><span>3</span></a></li>
                                <li><a href="#"><span>4</span></a></li>
                                <li><a href="#"><span>5</span></a></li>
                                <li><a href="#"><span>Next</span></a></li>
                            </ul>
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
                        <a href="imagen?id=<%=imgvo.getCodigoimg() %>" target="_blank"><img src="images/imagen.png" title="imagen"/> Ver imagen</a>
                        <%
                            } else {
                                out.print("No disponible");
                            }
                        %>
                    </td>
                </tr>
                <%      }
                    }%>
                    
            </tbody>
        </table>
       
    </div>
    </div>
    </div>
    </div>
                    
</body>
</html>
