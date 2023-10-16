package ma.projet.controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import javax.servlet.annotation.WebServlet;
import ma.projet.entities.Personne;
import ma.projet.services.PersonneService;

@WebServlet(name = "InscriptionController", urlPatterns = {"/InscriptionController"})
public class InscriptionController extends HttpServlet {

    private PersonneService personneService;

    @Override
    public void init() throws ServletException {
        super.init();
        personneService = new PersonneService();

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("newUsername");
        String password = request.getParameter("newPassword");
        String roleParam = request.getParameter("role");
        boolean role = false; // La valeur par défaut si le paramètre n'est pas défini.

        if (roleParam != null && roleParam.equals("true")) {
            role = true;
        }
        personneService.create(new Personne(username, password, role));
        response.sendRedirect("login.jsp");

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
