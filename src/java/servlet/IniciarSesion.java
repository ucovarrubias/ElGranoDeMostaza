/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controlador.AdminDAO;
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
import modelo.Admin;
import modelo.Cliente;
import modelo.Direccion;

/**
 *
 * @author ucova
 */
public class IniciarSesion extends HttpServlet {

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
        HttpSession session = request.getSession();
        String siguiente = "";
        
        
        // Obtiene de la solicitud los datos de un cliente y los guarda al bean cliente
        String usuario = request.getParameter("usuario");
        String contrasenia = request.getParameter("contrasenia");
        
        // Primero se autentica si es admin
        // Crea el objeto para acceder a la base de datos
        Admin admin = new Admin();
        BaseDAO<Admin> fachadaAdmin = new AdminDAO();
        admin = fachadaAdmin.autenticacion(usuario, contrasenia);

        // Si el admin existe en la base de datos
        if (admin != null){
            session.setAttribute("admin", admin);
            siguiente = "reportes.jsp";
            rd = request.getRequestDispatcher(siguiente);
            rd.forward(request, response);
        } else { //De lo contrario, autentica el cliente
            Cliente cliente = new Cliente();
            BaseDAO<Cliente> fachada = new ClientesDAO();
            cliente = fachada.autenticacion(usuario, contrasenia);
            
            // Si el cliente existe en la base de datos
            if (cliente != null) {
                BaseDAO<Direccion> fachada2 = new DireccionesDAO();
                Direccion direccion = fachada2.consultar(cliente.getIdCliente());


                // Crea la variable de solicitud cliente, con el cliente existente
                session.setAttribute("cliente", cliente);
                request.setAttribute("cliente", cliente);
                request.setAttribute("direccion", direccion);

                siguiente = "home.jsp";
                // Establece la página JSP o servlet siguiente
                rd = request.getRequestDispatcher(siguiente);

                // Redirecciona a la página JSP o servlet siguiente
                rd.forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Usuario o contraseña incorrectas");
                rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }
        }
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
