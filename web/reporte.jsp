<%-- 
    Document   : reportes
    Created on : 30/04/2022, 06:02:35 PM
    Author     : Andrea
--%>

<%@page import="modelo.Admin"%>
<%@page import="modelo.Producto"%>
<%@page import="controlador.ProductosDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="modelo.PedidoDetalles"%>
<%@page import="controlador.PedidosDetallesDAO"%>
<%@page import="controlador.DireccionesDAO"%>
<%@page import="modelo.Direccion"%>
<%@page import="controlador.ClientesDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controlador.PedidosDAO"%>
<%@page import="modelo.Pedido"%>
<%@page import="controlador.BaseDAO"%>
<%@page import="modelo.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    BaseDAO<Pedido> fachada = new PedidosDAO();
    BaseDAO<Cliente> clienteDAO = new ClientesDAO();
    PedidosDetallesDAO pedidosDAO = new PedidosDetallesDAO();
    DireccionesDAO direccionDAO = new DireccionesDAO();
    ArrayList<PedidoDetalles> pedidos = new ArrayList<PedidoDetalles>();
    ProductosDAO productoDAO = new ProductosDAO();

%>

<html>
    <head>
        <%  
            Admin admin = (Admin) session.getAttribute("admin");
            ArrayList<Pedido> listaPedidos = null;

            if (null == admin) {
                response.sendRedirect("index.jsp");
            } else {
                listaPedidos = (ArrayList<Pedido>) request.getAttribute("listaPedidos");
            }
            DateFormat df = new SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss");
        %>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Generacion de reportes</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/c7d94c22d4.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>

    <body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="50">

        <%@include file="jspf/navbar_negocio.jspf"%>

        <div class="container" style="padding-top:100px;">
            <div class="row">
                <div class="col">
                    <section>

                        <div class="row">
                            <table class="table table-striped">
                                <thead>
                                    <th>Folio</th>
                                    <th>Fecha</th>
                                    <th>Cliente</th>
                                    <th>Direcci&oacute;n</th>
                                    <th>Productos</th>
                                    <th>Total</th>
                                    <th>Estado del pedido</th>
                                </thead>
                                <%
                                    String txtPedidos = "";

                                    if (!listaPedidos.isEmpty()) {

                                        for (Pedido p : listaPedidos) {

                                            ArrayList<String> productos = new ArrayList<String>();

                                            Cliente c = clienteDAO.consultar(p.getClienteId());
                                            Direccion d = direccionDAO.consultarPorId(p.getDireccionId());

                                            pedidos = pedidosDAO.consultarPorIdPedido(p.getId());
                                            String direccion = d.getCalle() + ", " + d.getNumExterior() + ", " + d.getCiudad() + ", " + d.getEstado() + ", " + d.getPais() + ", " + String.valueOf(d.getCodigoPostal()) + ".";

                                            for (PedidoDetalles pd : pedidos) {
                                                Producto producto = productoDAO.consultar(pd.getProductoId());
                                                productos.add(pd.getCantidad() + " x " + producto.getNombre());
                                            }

                                            String stringPedidos
                                                    = "Folio: " + p.getFolio()+ "\n"
                                                    + "Fecha del pedido: " + df.format(p.getFechaPedido()) + "\n"
                                                    + "Cliente: " + c.getNombre() + " " + c.getApellido() + "\n"
                                                    + "Número de teléfono del cliente: " + c.getTelefono() + "\n"
                                                    + "Email del cliente: " + c.getEmail() + "\n"
                                                    + "Dirección de envio: " + direccion + "\n"
                                                    + "Productos del pedido: " + productos.toString() + "\n"
                                                    + "Total del pedido: " + p.getTotal() + "\n"
                                                    + "Estado del pedido: " + p.getEstadoPedido() + "\n"
                                                    + "------------------------------------------------------------------------------------------------------------------\n";

                                            txtPedidos = txtPedidos + stringPedidos;
                                %>
                                <tbody>
                                    <td><%= p.getFolio() %></td>
                                    <td><%= df.format(p.getFechaPedido()) %></td>
                                    <td><%= c.getNombre() + " " + c.getApellido()%></td>
                                    <td><%= direccion%></td>
                                    <td><%= productos.toString() %></td>
                                    <td><%= "$" + p.getTotal()%></td>
                                    <td><%= p.getEstadoPedido()%></td>
                                </tbody>

                                <%}
                                    }
                                %>
                            </table>
                        </div>

                        <div class="justify-content-between d-flex">
                                    
                            <a class="btn btn-primary" role="button" href="reportes.jsp">Regresar</a>
                            <button id="btn" type="submit" class="btn btn-primary">Descargar reporte</button>

                            <textarea id="text" hidden><%=txtPedidos%></textarea>

                            <script>
                                function download(file, text) {

                                    //creating an invisible element
                                    var element = document.createElement('a');
                                    element.setAttribute('href',
                                            'data:text/plain;charset=utf-8, '
                                            + encodeURIComponent(text));
                                    element.setAttribute('download', file);

                                    // Above code is equivalent to
                                    // <a href="path of file" download="file name">

                                    document.body.appendChild(element);

                                    //onClick property
                                    element.click();

                                    document.body.removeChild(element);
                                }

                                // Start file download.
                                document.getElementById("btn")
                                        .addEventListener("click", function () {
                                            // Generate download of hello.txt 
                                            // file with some content
                                            var text = document.getElementById("text").value;
                                            var filename = "Pedidos.txt";

                                            download(filename, text);
                                        }, false);
                            </script>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </body>
</html>
