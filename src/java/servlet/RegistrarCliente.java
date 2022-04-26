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
public class RegistrarCliente extends HttpServlet {

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
        RequestDispatcher rd;
        Cliente cliente = new Cliente();
        Direccion direccion = new Direccion();
        
        // Obtiene de la solicitud los datos de un cliente y los guarda al bean cliente
        cliente.setUsuario((String) request.getParameter("reg_usuario"));
        cliente.setEmail((String) request.getParameter("email"));
        cliente.setContrasenia((String) request.getParameter("reg_contrasenia"));
        cliente.setNombre((String) request.getParameter("nombre"));
        cliente.setApellido((String) request.getParameter("apellido"));
        cliente.setTelefono((String) request.getParameter("telefono"));
        
        // Crea el objeto para acceder a la base de datos
        BaseDAO<Cliente> fachada = new ClientesDAO();
        fachada.insertar(cliente);
        
        cliente = fachada.autenticacion(cliente.getUsuario(), cliente.getContrasenia());
        
        direccion.setCalle((String) request.getParameter("calle"));
        direccion.setNumExterior((String) request.getParameter("numero"));
        direccion.setCodigoPostal(Integer.parseInt(request.getParameter("codpostal")));
        direccion.setCiudad((String) request.getParameter("ciudad"));
        direccion.setEstado((String) request.getParameter("estado"));
        direccion.setPais((String) request.getParameter("pais"));
        direccion.setClienteId(cliente.getIdCliente());

        // Crea el objeto para acceder a la base de datos
        BaseDAO<Direccion> fachada2 = new DireccionesDAO();
        fachada2.insertar(direccion);
        
        HttpSession session = request.getSession();
        session.setAttribute("cliente", cliente);
        session.setAttribute("direccion", direccion);
        
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
