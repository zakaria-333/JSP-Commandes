/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ma.projet.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ma.projet.entity.Client;
import ma.projet.entity.Employe;
import ma.projet.entity.User;
import ma.projet.service.ClientService;
import ma.projet.service.EmployeService;
import ma.projet.service.UserService;
import ma.projet.util.Utils;
import ma.projet.util.SendEmail;
import java.util.Random;

/**
 *
 * @author Lachgar
 */
@WebServlet(name = "Auth", urlPatterns = {"/auth"})
public class Auth extends HttpServlet {

    private String generateRandomCode() {
        // Caractères possibles pour le code
        String characters = "0123456789";

        // Initialiser un générateur de nombres aléatoires
        Random random = new Random();

        StringBuilder code = new StringBuilder();

        // Générer le code en fonction de la longueur spécifiée
        for (int i = 0; i < 4; i++) {
            int index = random.nextInt(characters.length());
            code.append(characters.charAt(index));
        }

        return code.toString();
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
        String op = request.getParameter("op");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        ClientService cs = new ClientService();
        EmployeService es = new EmployeService();
        UserService us = new UserService();
        Client clt = cs.getByEmail(email);
        Employe emp = es.getByEmail(email);
        HttpSession session = request.getSession();

        if (op != null && op.equals("envoyeEmail")) {
            User user = us.getByEmail(email);
            if (user != null) {
                String code = generateRandomCode();
                SendEmail.sendEmail(email, "code de validation", code);
                session.setAttribute("email", email);
                request.setAttribute("code", code);
                request.getRequestDispatcher("ValiderCode.jsp").forward(request, response);

            } else {
                request.setAttribute("msg", "Unvalid email");
                request.getRequestDispatcher("EnvoyeEmail.jsp").forward(request, response);
            }

        } else if (op != null && op.equals("modifierPassword")) {
            User user = us.getByEmail(email);
            user.setPassword(password);
            us.update(user);
            response.sendRedirect("auth.jsp");
        } else {

            if (clt != null && clt.getPassword().equals(Utils.MD5(password))) {
                // Authentification réussie pour le client

                session.setAttribute("client", clt);
                request.getRequestDispatcher("welcomeClient.jsp").forward(request, response);
            } else if (emp != null && emp.getPassword().equals(Utils.MD5(password))) {
                // Authentification réussie pour l'employé

                session.setAttribute("employe", emp);
                request.getRequestDispatcher("welcomeEmploye.jsp").forward(request, response);
            } else {
                // Authentification échouée
                request.setAttribute("msg", "Email or password incorrect");
                request.getRequestDispatcher("auth.jsp").forward(request, response);
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
