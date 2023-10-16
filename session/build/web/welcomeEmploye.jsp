<%-- 
    Document   : welcome
    Created on : 10 oct. 2023, 12:25:31
    Author     : Lachgar
--%>

<%@page import="ma.projet.entity.Employe"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%! Employe e;%>
        <%
          if(session==null){
              response.sendRedirect("auth.jsp");
          } else{
              e = (Employe)session.getAttribute("employe");
          }
                %>
        <h1>
            Bonjour Employe : <%= e.getEmail() %>
            
        </h1>
    </body>
</html>
