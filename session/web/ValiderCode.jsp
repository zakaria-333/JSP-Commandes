<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validation de Code</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </head>
    <script>
                function compareCodes() {
                let code = document.getElementsByName('code')[0].value;
                        let codeRecu = document.getElementsByName('codeRecu')[0].value;
                        if (code === codeRecu) {
                alert('Code valide !!');
                        document.getElementById('c').style.display = 'block';
                } else {
                alert('Code invalide !!');
                }
                }

        function ComparePassword() {
        let password = document.getElementsByName('password')[0].value;
                let cPassword = document.getElementsByName('ConfirmPassword')[0].value;
                if (password === cPassword) {
        alert('Mot de passe modifié !');
                return true;
        } else {
        alert('Les mots de passe ne sont pas identiques !');
                return false;
        }
        }
    </script>
    <body>


        <div class="container border border-info border-4 p-5 d-flex align-items-center justify-content-center" style="width: 400px;margin-top: 20px">

            <form>
                <h1 class="text-center">VALIDATION DU CODE</h1>
                <div class="mb-3">
                    <label for="code" class="form-label">Code</label>
                    <input type="text" class="form-control" name="code">
                    <input hidden type="text" name="codeRecu" value="${code}">
                </div>
                <input  class="btn btn-primary" value="Valider" onclick="compareCodes()">
            </form>
        </div>
        <div class="container" style="width: 60%; margin-top: 50px">
            <form action="auth" method="POST" id="c" style="display: none" onsubmit="return ComparePassword()">
                <h1 class="text-center">MODIFICATION DU MOT DE PASSE</h1>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" name="password">
                    <input type="text" name="email" value=<%= session.getAttribute("email")%> hidden>
                    <input type="text" name="op" value="modifierPassword" hidden>
                </div>
                <div class="mb-3">
                    <label for="ConfirmPassword" class="form-label">Confirm Password</label>
                    <input type="password" class="form-control" name="ConfirmPassword">
                </div>
                <input type="submit" class="btn btn-primary" value="Modifier">
            </form>
        </div>
    </body>
</html>
