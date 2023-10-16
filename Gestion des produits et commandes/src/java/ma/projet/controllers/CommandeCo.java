package ma.projet.controllers;

import ma.projet.entities.Commande;
import ma.projet.entities.Personne;
import ma.projet.services.CommandeService;
import ma.projet.services.PersonneService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import ma.projet.entities.LigneCommandeProduit;
import ma.projet.services.LigneCommandeProduitService;
import ma.projet.services.ProduitService;

@WebServlet(name = "CommandeCo", urlPatterns = {"/CommandeCo"})
public class CommandeCo extends HttpServlet {

    private CommandeService commandeService;
    private PersonneService personneService;
    private LigneCommandeProduitService ls;

    @Override
    public void init() throws ServletException {
        super.init();
        commandeService = new CommandeService();
        personneService = new PersonneService();
        ls = new LigneCommandeProduitService();

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = request.getParameter("op");

        if ("createCommande".equals(op)) {
          
            String username = (String) request.getSession().getAttribute("username");
            Personne client = personneService.getByUsername(username);

            if (client != null) {
                
                Commande nouvelleCommande = new Commande();
                nouvelleCommande.setCode(request.getParameter("code"));
                nouvelleCommande.setDate(new Date());
                nouvelleCommande.setClient(client);
                

                commandeService.create(nouvelleCommande);
                
      

            } else {
                
                response.sendRedirect("Erreur.jsp");
            }
        }
    
    }
}