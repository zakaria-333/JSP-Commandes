package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <title>Connexion</title>\n");
      out.write("    <!-- Inclure Bootstrap CSS -->\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">\n");
      out.write("    <!-- Inclure Font Awesome pour les icônes -->\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css\">\n");
      out.write("    <style>\n");
      out.write("        \n");
      out.write("        body {\n");
      out.write("           background: linear-gradient(45deg, #FFD700, #008000, #FFA500, #FF0000);\n");
      out.write("            background-size: 400% 400%;\n");
      out.write("            animation: gradient 15s linear infinite;\n");
      out.write("            height: 100vh;\n");
      out.write("            margin: 0;\n");
      out.write("            display: flex;\n");
      out.write("            justify-content: center;\n");
      out.write("            align-items: center;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        @keyframes gradient {\n");
      out.write("            0% {\n");
      out.write("                background-position: 0% 50%;\n");
      out.write("            }\n");
      out.write("            50% {\n");
      out.write("                background-position: 100% 50%;\n");
      out.write("            }\n");
      out.write("            100% {\n");
      out.write("                background-position: 0% 50%;\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .container {\n");
      out.write("            background-color: #ffffff;\n");
      out.write("            padding: 30px; /* Augmenter la marge intérieure */\n");
      out.write("            border-radius: 10px; /* Augmenter la bordure */\n");
      out.write("            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.3); /* Augmenter l'ombre */\n");
      out.write("            max-width: 500px; /* Largeur maximale légèrement augmentée */\n");
      out.write("            width: 100%;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        h1 {\n");
      out.write("            text-align: center;\n");
      out.write("            margin-bottom: 30px; /* Augmenter la marge inférieure */\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        form {\n");
      out.write("            text-align: center;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        label {\n");
      out.write("            font-weight: bold;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        input[type=\"text\"],\n");
      out.write("        input[type=\"password\"] {\n");
      out.write("            width: 100%;\n");
      out.write("            padding: 15px; /* Augmenter la hauteur et la largeur de la zone de saisie */\n");
      out.write("            margin-bottom: 30px; /* Augmenter la marge inférieure */\n");
      out.write("            border: 2px solid #ced4da;\n");
      out.write("            border-radius: 5px; /* Augmenter l'arrondi des coins */\n");
      out.write("            font-size: 16px; /* Augmenter la taille de la police */\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        input[type=\"submit\"] {\n");
      out.write("            background-color: #007bff;\n");
      out.write("            color: #fff;\n");
      out.write("            padding: 15px 30px; /* Augmenter la hauteur et la largeur du bouton */\n");
      out.write("            border: none;\n");
      out.write("            border-radius: 5px; /* Augmenter l'arrondi des coins */\n");
      out.write("            font-size: 18px; /* Augmenter la taille de la police */\n");
      out.write("            cursor: pointer;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        input[type=\"submit\"]:hover {\n");
      out.write("            background-color: #0056b3;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        p {\n");
      out.write("            text-align: center;\n");
      out.write("            margin-top: 20px; /* Augmenter la marge supérieure */\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        a {\n");
      out.write("            color: #007bff;\n");
      out.write("            text-decoration: none;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        a:hover {\n");
      out.write("            text-decoration: underline;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* Style pour les icônes */\n");
      out.write("        .icon {\n");
      out.write("            font-size: 24px; /* Taille de l'icône */\n");
      out.write("            margin-right: 10px; /* Marge à droite de l'icône */\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <h1> Connexion</h1>\n");
      out.write("        <c:if test=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${not empty requestScope.message}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("            <div >");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.message}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</div>\n");
      out.write("        </c:if>\n");
      out.write("\n");
      out.write("        <form action=\"AuthServlet\" method=\"post\">\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"username\"><i class=\"fas fa-user icon\"></i> Nom d'utilisateur :</label>\n");
      out.write("                <input type=\"text\" class=\"form-control\" id=\"username\" name=\"username\" required>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"password\"><i class=\"fas fa-lock icon\"></i> Mot de passe :</label>\n");
      out.write("                <input type=\"password\" class=\"form-control\" id=\"password\" name=\"password\" required>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <a href=\"Categorie.jsp\"><input type=\"submit\" class=\"btn btn-primary\" value=\"Se connecter\"></a>\n");
      out.write("            </div>\n");
      out.write("        </form>\n");
      out.write("\n");
      out.write("        <p>Pas encore inscrit ? <a href=\"inscription.jsp\">S'inscrire</a></p>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <!-- Inclure Font Awesome pour les icônes -->\n");
      out.write("    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js\"></script>\n");
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
