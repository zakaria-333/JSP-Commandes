package ma.projet.controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import javax.servlet.annotation.WebServlet;
import ma.projet.entities.Personne;
import ma.projet.services.PersonneService;

@WebServlet(name = "AuthServlet", urlPatterns = {"/AuthServlet"})
public class AuthServlet extends HttpServlet {
    private PersonneService personneService;

    @Override
    public void init() throws ServletException {
        super.init();
        personneService = new PersonneService();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
  
        String username = request.getParameter("username");
        String password = request.getParameter("password");
       

        // Vérifiez les informations d'authentification
        if (isAdmin(username, password)) {
            request.getSession().setAttribute("username", username);
            response.sendRedirect("Employee.jsp");
        } else if (isClient(username, password)) {
            request.getSession().setAttribute("username", username);
            response.sendRedirect("Etudiant.jsp");
        } else {
            request.setAttribute("message", "Identifiants incorrects");
            request.getSession().setAttribute("username", username);
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
    }
    
    private boolean isAdmin(String username, String password) {
        List<Personne> personnes = personneService.findAll();

        for (Personne personne : personnes) {
            if (personne.getUserName().equals(username) && personne.getMdp().equals(password) && personne.isIsAdmin()) {
                return true;
            }
        }
        
        return false; 
    }
    
    private boolean isClient(String username, String password) {
        List<Personne> personnes = personneService.findAll();

        for (Personne personne : personnes) {
            if (personne.getUserName().equals(username) && personne.getMdp().equals(password) && !personne.isIsAdmin()) {
                return true;
            }
        }
        
        return false; 
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
