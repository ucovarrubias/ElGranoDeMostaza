<%-- 
    Document   : reportes
    Created on : 30/04/2022, 06:02:35 PM
    Author     : Andrea
--%>

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
    ArrayList<PedidoDetalles> pedidos = new ArrayList<>();

%>

<html>
    <head>
        <%            Cliente cliente = (Cliente) session.getAttribute("cliente");
            ArrayList<Pedido> listaPedidos = null;

            if (null == cliente) {
                response.sendRedirect("index.jsp");
            } else {
                listaPedidos = (ArrayList<Pedido>) request.getAttribute("listaPedidos");
            }
        %>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Generacion de reportes</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/c7d94c22d4.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="preconnect" href="css/style.css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>

    <body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="50">

        <%@include file="jspf/navbar_negocio.jspf"%>

        <div class="container-fluid m-0 px-0" style="padding-top:100px;">
            <div class="row">
                <div class="col-sm-3"></div>
                <div class="col">
                    <section>

                        <div class="row">
                            <table class="table">
                                <tr>
                                    <td>Id Pedido</td>
                                    <td>Fecha</td>
                                    <td>Cliente</td>
                                    <td>Direccion</td>
                                    <td>Productos</td>
                                    <td>Subtotal</td>
                                    <td>Total</td>
                                    <td>Estado del pedido</td>
                                </tr>
                                <%
                                    String txtPedidos = "";

                                    if (!listaPedidos.isEmpty()) {

                                        for (Pedido p : listaPedidos) {

                                            ArrayList<Integer> productos = new ArrayList<>();

                                            Cliente c = clienteDAO.consultar(p.getClienteId());
                                            Direccion d = direccionDAO.consultarPorId(p.getDireccionId());

                                            pedidos = pedidosDAO.consultarPorIdPedido(p.getId());
                                            String direccion = d.getCalle() + " ," + d.getNumExterior() + ", " + d.getCiudad() + ", " + d.getEstado() + ", " + d.getPais() + ", " + String.valueOf(d.getCodigoPostal()) + ".";

                                            for (PedidoDetalles pd : pedidos) {
                                                productos.add(pd.getProductoId());
                                            }

                                            String stringPedidos
                                                    = "Id del pedido: " + p.getId() + "\n"
                                                    + "Fecha del pedido: " + p.getFechaPedido() + "\n"
                                                    + "Cliente: " + c.getNombre() + " " + c.getApellido() + "\n"
                                                    + "Numero de telefono del cliente: " + c.getTelefono() + "\n"
                                                    + "Email del cliente: " + c.getEmail() + "\n"
                                                    + "Direccion de envio: " + direccion + "\n"
                                                    + "Id de productos del pedido: " + productos.toString() + "\n"
                                                    + "Subtotal del pedido: " + p.getSubtotal() + "\n"
                                                    + "Total del pedido: " + p.getTotal() + "\n"
                                                    + "Estado del pedido: " + "\n"
                                                    + "------------------------------------------------------------------------------------------------------------------\n";

                                            txtPedidos = txtPedidos + stringPedidos;

                                %>
                                <tr>
                                    <td><%= p.getId()%></td>
                                    <td><%= p.getFechaPedido()%></td>
                                    <td><%= c.getNombre() + " " + c.getApellido()%></td>
                                    <td><%= direccion%></td>
                                    <td><%= productos.toString()%></td>
                                    <td><%= p.getSubtotal()%></td>
                                    <td><%= p.getTotal()%></td>
                                    <td></td>
                                </tr>

                                <%}
                                    }
                                %>
                            </table>
                        </div>

                        <div class="text-end">
                            <br>
                            <button id="btn" type="submit" class="btn btn-primary mb-5">Generar reporte</button>

                            <textarea id="text" hidden><%=txtPedidos%>
                            </textarea>

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
                <div class="col-sm-3"></div>
            </div>
        </div>
    </body>
</html>
