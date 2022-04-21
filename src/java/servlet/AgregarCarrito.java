/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controlador.BaseDAO;
import controlador.CarritoDAO;
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

/**
 *
 * @author ucova
 */
public class AgregarCarrito extends HttpServlet {

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
        String tareaSel = request.getParameter("tarea");
        // Obten el objeto session que contiene a las variables con ámbito de sesion
        HttpSession session = request.getSession();
        RequestDispatcher rd;
        
        BaseDAO<Carrito> carritoDAO = new CarritoDAO();
        
        Cliente cliente = (Cliente) session.getAttribute("cliente");
        Carrito carrito = new Carrito();
        
        if (tareaSel.equals("agregarCarrito")){
            if(!carritoDAO.consultarPorCliente(cliente.getIdCliente()).isEmpty()){
                boolean agregar = true;
                ArrayList<Carrito> listaCarrito = carritoDAO.consultarPorCliente(cliente.getIdCliente());
                for(Carrito c: listaCarrito){
                    if(c.getProductoId().equals(Integer.parseInt(request.getParameter("id")))){
                        c.setCantidad(c.getCantidad()+1);
                        agregar = false;
                        try {
                            carritoDAO.actualizar(c);
                        } catch (Exception ex){
                            System.err.println(ex.getMessage());
                        }
                    }
                }
                if (agregar == true){
                    carrito.setClienteId(cliente.getIdCliente());
                    carrito.setProductoId(Integer.parseInt(request.getParameter("id")));
                    carrito.setPrecio(Float.parseFloat(request.getParameter("total")));
                    carrito.setCantidad(1);
                    carritoDAO.insertar(carrito);
                }
            } else {
                carrito.setClienteId(cliente.getIdCliente());
                carrito.setProductoId(Integer.parseInt(request.getParameter("id")));
                carrito.setPrecio(Float.parseFloat(request.getParameter("total")));
                carrito.setCantidad(1);
                carritoDAO.insertar(carrito);
            }
        }
        
        if (tareaSel.equals("actualizarCarrito")){
            
            carrito = carritoDAO.consultar(Integer.parseInt(request.getParameter("id")));
            if (request.getParameter("cantidad").equals("0")){
                carritoDAO.eliminar(carrito.getId());
            } else {
                carrito.setCantidad(Integer.parseInt(request.getParameter("cantidad")));
                try {
                    carritoDAO.actualizar(carrito);
                } catch (Exception e){
                    System.err.println(e.getMessage());
                }
            }
        }
        
        if (tareaSel.equals("eliminarCarrito")){
            carrito = carritoDAO.consultar(Integer.parseInt(request.getParameter("id")));
            carritoDAO.eliminar(carrito.getId());
        }
        
        rd = request.getRequestDispatcher("carrito.jsp");
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
