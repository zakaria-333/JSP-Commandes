<%-- 
    Document   : Etudiant
    Created on : 11 oct. 2023, 03:35:44
    Author     : pc
--%>

<%@page import="ma.projet.services.PersonneService"%>
<%@page import="ma.projet.entities.Personne"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Etudiant Page</title>
    </head>
    <body>
        <%
            try {
                // Récupérer l'ID du client connecté depuis la session
                String username = (String) request.getSession().getAttribute("username");
                PersonneService personneService = new PersonneService();
                Personne etudiant = personneService.getByUsername(username);
        %>
        <h1>Bonjour Etudiant <%= etudiant.getUserName()%></h1>
        
        <%
            } catch (Exception e) {
                e.printStackTrace();
                // Gérer l'exception ici, par exemple, afficher un message d'erreur.
                out.println("Une erreur s'est produite : " + e.getMessage());
            }
        %>
        <a href="login.jsp">Se deconnecter</a>
    </body>
</html>
