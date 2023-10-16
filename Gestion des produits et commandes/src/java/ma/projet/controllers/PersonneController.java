/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ma.projet.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ma.projet.entities.Personne;
import ma.projet.services.PersonneService;

/**
 *
 * @author Lachgar
 */
@WebServlet(name = "PersonneController", urlPatterns = {"/PersonneController"})
public class PersonneController extends HttpServlet {

    private PersonneService cs;

    @Override
    public void init() throws ServletException {
        super.init(); //To change body of generated methods, choose Tools | Templates.
        cs = new PersonneService();
    }

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

        if (request.getParameter("op") != null) {
            String op = request.getParameter("op");
            if (op.equals("delete")) {
                cs.delete(cs.getById(Integer.parseInt(request.getParameter("id"))));
            }
            if (op.equals("update")) {
                Personne c = cs.getById(Integer.parseInt(request.getParameter("id")));
                String username = request.getParameter("username");
                String mdp = request.getParameter("mdp");
                String type = request.getParameter("type");
                boolean isAdmin = "true".equals(type);
                c.setUserName(username);
                c.setMdp(mdp);
                c.setIsAdmin(isAdmin);
                cs.update(c);
            }

        } else {
            String username = request.getParameter("username");
            String mdp = request.getParameter("password");
            String type = request.getParameter("type");
            boolean isAdmin = "true".equals(type);

            cs.create(new Personne(username, mdp, isAdmin));
        }
        response.sendRedirect("Personne.jsp");

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
