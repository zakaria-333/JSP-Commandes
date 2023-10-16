<%-- 
    Document   : auth
    Created on : 10 oct. 2023, 12:10:57
    Author     : Lachgar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Envoye Email</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </head>
    <body>
        



        <div class="container border border-info border-4 p-5 d-flex align-items-center justify-content-center" style="width: 500px; margin-top: 200px">

            <form action="auth" method="POST">
                <h1 class="text-center">RECUPERATION DU CODE</h1>
                <div class="mb-3">
                    <label for="email" class="form-label">Email address</label>
                    <input type="email" class="form-control" name="email">
                    <input type="text" name="op" value="envoyeEmail" hidden>
                </div>
                <p>${msg}</p>
                <input type="submit" class="btn btn-primary" value="Envoyer code">
            </form>

        </div>
    </body>
</html>