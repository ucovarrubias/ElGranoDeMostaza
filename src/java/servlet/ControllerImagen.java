package servlet;

import Conexion.sql;

import VO.ImagenVO;
import controlador.ImagenDAO;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(name = "ControllerImagen", urlPatterns = {"/ControllerImagen"})
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
/**
 *
 * @author Erwing
 */
public class ControllerImagen extends HttpServlet {

    public static final String lIST_STUDENT = "/Pagina1.jsp";
    public static final String INSERT_OR_EDIT = "/Pagina2.jsp";

    String estado = null;
    ImagenDAO imagendao;
    int id_pdf = -1;

    public ControllerImagen() {
        imagendao = new ImagenDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String forward = "";
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("delete")) {
            forward = lIST_STUDENT;
            int studentId = Integer.parseInt(request.getParameter("id"));
            imagendao.Eliminar_ImagenVO(studentId);
        }
        if (action.equalsIgnoreCase("edit")) {
            forward = INSERT_OR_EDIT;
            int studentIdM = Integer.parseInt(request.getParameter("id"));
            id_pdf = studentIdM;
            ImagenVO imagenvo = imagendao.getImagenVOById(studentIdM);
            request.setAttribute("row", imagenvo);
            boolean boo = false;
            if (imagenvo.getArchivoimg2() != null) {
                boo = true;
            }
            request.setAttribute("row2", boo);
            estado = "edit";
        } else if (action.equalsIgnoreCase("insert")) {
            forward = INSERT_OR_EDIT;
            estado = "insert";
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ImagenVO imagenvo = new ImagenVO();
        sql auto = new sql();
        int nuevoid = auto.auto_increm("SELECT MAX(codigoimg) FROM imagen;");
        
        try{
            String name = request.getParameter("txtname");
            imagenvo.setNombreimg(name);
        }catch(Exception ex){
            System.out.println("nombre: "+ex.getMessage());
        }

        InputStream inputStream = null;
        try {
            Part filePart = request.getPart("fichero");
            if (filePart.getSize() > 0) {
                System.out.println(filePart.getName());
                System.out.println(filePart.getSize());
                System.out.println(filePart.getContentType());
                inputStream = filePart.getInputStream();
            }
        } catch (Exception ex) {
            System.out.println("fichero: "+ex.getMessage());
        }

        try {
            
            if (estado.equalsIgnoreCase("insert")) {
                imagenvo.setCodigoimg(nuevoid);
                if (inputStream != null) {
                    imagenvo.setArchivoimg(inputStream);
                }
                imagendao.Agregar_ImagenVO(imagenvo);
            } else {
                imagenvo.setCodigoimg(id_pdf);
                if (inputStream != null) {
                    imagenvo.setArchivoimg(inputStream);
                    imagendao.Modificar_ImagenVO(imagenvo);
                } else {
                    imagendao.Modificar_ImagenVO2(imagenvo);
                }
            }
        } catch (Exception ex) {
            System.out.println("textos: "+ex.getMessage());
        }

        RequestDispatcher view = request.getRequestDispatcher("/Pagina1.jsp");
        view.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
