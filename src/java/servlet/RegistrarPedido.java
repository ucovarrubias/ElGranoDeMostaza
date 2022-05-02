/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controlador.BaseDAO;
import controlador.CarritoDAO;
import controlador.DireccionesDAO;
import controlador.PedidosDAO;
import controlador.PedidosDetallesDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Carrito;
import modelo.Cliente;
import modelo.Direccion;
import modelo.Pedido;
import modelo.PedidoDetalles;

/**
 *
 * @author ucova
 */
public class RegistrarPedido extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        RequestDispatcher rd;
        
        // Se declaran las DAOs necesarias para las transacciones
        BaseDAO<Carrito> carritoDAO = new CarritoDAO();
        BaseDAO<PedidoDetalles> pdDAO = new PedidosDetallesDAO();
        BaseDAO<Pedido> pedidoDAO = new PedidosDAO();
        BaseDAO<Direccion> direccionDAO = new DireccionesDAO();
        
        // Se obtiene al cliente de la sesión
        Cliente cliente = (Cliente) session.getAttribute("cliente");
        
        // Se crean los objetos negocios
        PedidoDetalles pd = new PedidoDetalles();
        Pedido pedido = new Pedido(cliente.getIdCliente());
        Direccion direccion = direccionDAO.consultar(cliente.getIdCliente());
        
        // Se crea el pedido para obtener su id
        pedidoDAO.insertar(pedido);
        pedido = pedidoDAO.consultar(cliente.getIdCliente());
        Integer ultimoPedido = pedido.getId();
        
        Float subtotal = 0.00f;
        
        ArrayList<Carrito> listaCarrito = carritoDAO.consultarPorCliente(cliente.getIdCliente());
        for(Carrito c: listaCarrito){
            pd.setPedidoId(ultimoPedido);
            pd.setProductoId(c.getProductoId());
            pd.setPrecio(c.getPrecio());
            pd.setCantidad(c.getCantidad());
            subtotal += c.getPrecio() * c.getCantidad();
            pdDAO.insertar(pd);
            carritoDAO.eliminar(c.getId());
        }
        
        pedido.setSubtotal(subtotal);
        pedido.setIva(subtotal*0.16f);
        pedido.setTotal(subtotal*1.16f);
        pedido.setDireccionId(direccion.getId());
        pedido.setEmailPedido(cliente.getEmail());
        try {
            pedidoDAO.actualizar(pedido);
        } catch (Exception ex){
            System.err.println(ex.getMessage());
        }
        
        request.setAttribute("totalPedido", (String.valueOf(subtotal*1.16f)));
        
        rd = request.getRequestDispatcher("confirmacion.jsp");
        rd.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
