package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import ma.projet.entities.Produit;
import ma.projet.entities.Personne;
import java.util.List;
import ma.projet.services.ProduitService;
import ma.projet.services.PersonneService;

public final class Acceuil_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <title>Accueil</title>\n");
      out.write("    <!-- Ajout de Bootstrap -->\n");
      out.write("    <link href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("    <style>\n");
      out.write("        /* Augmenter la taille de la police pour tous les éléments */\n");
      out.write("        body, h1, h2, p, th, td, input, button {\n");
      out.write("            font-size: 30px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* Augmenter les dimensions de tous les composants */\n");
      out.write("        .container {\n");
      out.write("            padding: 30px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* Centrer le bouton \"Se déconnecter\" */\n");
      out.write("        .logout-button-container {\n");
      out.write("            text-align: center;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* Augmenter la taille de la police de tous les boutons */\n");
      out.write("        button {\n");
      out.write("            font-size: 30px;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("    ");

        // Récupérer l'ID du client connecté depuis la session
        String username = (String) request.getSession().getAttribute("username");
        PersonneService personneService = new PersonneService();
        Personne client = personneService.getByUsername(username);
    
      out.write("\n");
      out.write("    \n");
      out.write("    <div class=\"container\">\n");
      out.write("        <h1 class=\"mt-5\">Bienvenue, ");
      out.print( client.getUserName() );
      out.write("</h1>\n");
      out.write("        \n");
      out.write("        <table class=\"table table-striped mt-4\">\n");
      out.write("            <thead>\n");
      out.write("                <tr>\n");
      out.write("                    <th scope=\"col\">Nom du Produit</th>\n");
      out.write("                    <th scope=\"col\">Prix</th>\n");
      out.write("                    <th scope=\"col\">qstock</th>\n");
      out.write("                    <th scope=\"col\">Quantité</th>\n");
      out.write("                    <th scope=\"col\">Action</th>\n");
      out.write("                </tr>\n");
      out.write("            </thead>\n");
      out.write("            <tbody>\n");
      out.write("                ");

                    ProduitService produitService = new ProduitService();
                    List<Produit> produits = produitService.findAll();
                    
                    for (Produit produit : produits) {
                
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <td>");
      out.print( produit.getReference() );
      out.write("</td>\n");
      out.write("                    <td>");
      out.print( produit.getPrix() );
      out.write("</td>\n");
      out.write("                    <td>");
      out.print( produit.getqStock() );
      out.write("</td>\n");
      out.write("                    <td>\n");
      out.write("                        <input class=\"quantite form-control\" type=\"number\" min=\"1\" max=\"");
      out.print( produit.getqStock() );
      out.write("\" id=\"quantite_");
      out.print( produit.getReference() );
      out.write("\">\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        <button class=\"btn btn-primary\" onclick=\"ajouterAuPanier('");
      out.print( produit.getReference() );
      out.write("', '");
      out.print( produit.getPrix() );
      out.write("')\">Ajouter au panier</button>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                ");

                    }
                
      out.write("\n");
      out.write("            </tbody>\n");
      out.write("        </table>\n");
      out.write("\n");
      out.write("        <div class=\"mt-5\">\n");
      out.write("            <h2>Panier</h2>\n");
      out.write("            <table class=\"table table-striped\">\n");
      out.write("                <thead>\n");
      out.write("                    <tr>\n");
      out.write("                        <th scope=\"col\">Nom du Produit</th>\n");
      out.write("                        <th scope=\"col\">Prix</th>\n");
      out.write("                        <th scope=\"col\">Quantité</th>\n");
      out.write("                    </tr>\n");
      out.write("                </thead>\n");
      out.write("                <tbody id=\"panierTable\">\n");
      out.write("                    <!-- Le contenu du panier sera ajouté ici dynamiquement -->\n");
      out.write("                </tbody>\n");
      out.write("            </table>\n");
      out.write("            \n");
      out.write("            <form action=\"CommandeCo\" method=\"post\">\n");
      out.write("                <input type=\"hidden\" name=\"op\" value=\"createCommande\">\n");
      out.write("                <input type=\"hidden\" name=\"clientId\" value=\"");
      out.print( client.getId() );
      out.write("\">\n");
      out.write("                <input type=\"text\" name=\"code\" placeholder=\"Code de commande\" required class=\"form-control mb-2\">\n");
      out.write("                <button type=\"submit\" class=\"btn btn-success\">Confirmer le panier</button>\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    \n");
      out.write("    <div class=\"logout-button-container\">\n");
      out.write("        <p class=\"mt-5\"><a href=\"login.jsp\" class=\"btn btn-danger logout-button\">Se déconnecter</a></p>\n");
      out.write("    </div>\n");
      out.write("    \n");
      out.write("    <script>\n");
      out.write("        var panier = [];\n");
      out.write("\n");
      out.write("        function ajouterAuPanier(reference, prix) {\n");
      out.write("            var inputQuantite = document.getElementById('quantite_' + reference);\n");
      out.write("            var quantite = inputQuantite.value;\n");
      out.write("            var produit = {\n");
      out.write("                reference: reference,\n");
      out.write("                prix: prix,\n");
      out.write("                quantite: quantite\n");
      out.write("            };\n");
      out.write("\n");
      out.write("           \n");
      out.write("            panier.push(produit);\n");
      out.write("            \n");
      out.write("           \n");
      out.write("            var panierTable = document.getElementById(\"panierTable\");\n");
      out.write("            var newRow = panierTable.insertRow();\n");
      out.write("            var cell1 = newRow.insertCell(0);\n");
      out.write("            var cell2 = newRow.insertCell(1);\n");
      out.write("            var cell3 = newRow.insertCell(2);\n");
      out.write("            cell1.innerHTML = reference;\n");
      out.write("            cell2.innerHTML = prix;\n");
      out.write("            cell3.innerHTML = quantite;\n");
      out.write("\n");
      out.write("            alert(\"Produit ajouté au panier avec succès !\");\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("        document.querySelector(\"form\").addEventListener(\"keypress\", function (e) {\n");
      out.write("            if (e.keyCode === 13) {\n");
      out.write("                e.preventDefault();\n");
      out.write("            }\n");
      out.write("        });\n");
      out.write("    </script>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
