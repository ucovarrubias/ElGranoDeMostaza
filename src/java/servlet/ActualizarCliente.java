/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controlador.BaseDAO;
import controlador.ClientesDAO;
import controlador.DireccionesDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Cliente;
import modelo.Direccion;

/**
 *
 * @author ucova
 */
public class ActualizarCliente extends HttpServlet {

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
        // Obten de la solicitud, la tarea seleccionada del menú de videojuegos
        String tareaSel = request.getParameter("tarea");
        // Obten el objeto session que contiene a las variables con ámbito de sesion
        HttpSession session = request.getSession();
        RequestDispatcher rd;
        
        Cliente cliente = (Cliente) session.getAttribute("cliente");
        Direccion direccion = (Direccion) session.getAttribute("direccion");
        
        BaseDAO<Cliente> fachada = new ClientesDAO();
        BaseDAO<Direccion> fachada2 = new DireccionesDAO();
        
        switch (tareaSel) {
            case "actualizarUsuario":
                cliente.setUsuario(request.getParameter("usuario"));
                try {
                    fachada.actualizar(cliente);
                } catch (Exception e){
                    System.err.println(e.getMessage());
                }
                break;
            case "actualizarEmail":
                cliente.setEmail(request.getParameter("email"));
                try {
                    fachada.actualizar(cliente);
                } catch (Exception e){
                    System.err.println(e.getMessage());
                }
                break;
            case "actualizarNombre":
                cliente.setNombre(request.getParameter("nombre"));
                try {
                    fachada.actualizar(cliente);
                } catch (Exception e){
                    System.err.println(e.getMessage());
                }
                break;
            case "actualizarApellido":
                cliente.setApellido(request.getParameter("apellido"));
                try {
                    fachada.actualizar(cliente);
                } catch (Exception e){
                    System.err.println(e.getMessage());
                }
                break;
            case "actualizarCalle":
                direccion.setCalle(request.getParameter("calle"));
                try {
                    fachada2.actualizar(direccion);
                } catch (Exception e){
                    System.err.println(e.getMessage());
                }
                break;
            case "actualizarNumExterior":
                direccion.setNumExterior(request.getParameter("numExterior"));
                try {
                    fachada2.actualizar(direccion);
                } catch (Exception e){
                    System.err.println(e.getMessage());
                }
                break;
            case "actualizarCodigoPostal":
                direccion.setCodigoPostal(Integer.parseInt(request.getParameter("codigoPostal")));
                try {
                    fachada2.actualizar(direccion);
                } catch (Exception e){
                    System.err.println(e.getMessage());
                }
                break;
            case "actualizarCiudad":
                direccion.setCiudad(request.getParameter("ciudad"));
                try {
                    fachada2.actualizar(direccion);
                } catch (Exception e){
                    System.err.println(e.getMessage());
                }
                break;
            case "actualizarEstado":
                direccion.setEstado(request.getParameter("estado"));
                try {
                    fachada2.actualizar(direccion);
                } catch (Exception e){
                    System.err.println(e.getMessage());
                }
                break;
            case "actualizarPais":
                direccion.setPais(request.getParameter("pais"));
                try {
                    fachada2.actualizar(direccion);
                } catch (Exception e){
                    System.err.println(e.getMessage());
                }
                break;
            case "actualizarTelefono":
                cliente.setTelefono(request.getParameter("telefono"));
                try {
                    fachada.actualizar(cliente);
                } catch (Exception e){
                    System.err.println(e.getMessage());
                }
                break;
            default:
                break;
        }
        rd = request.getRequestDispatcher("home.jsp");
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
