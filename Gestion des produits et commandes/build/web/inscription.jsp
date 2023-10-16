<!DOCTYPE html>
<html>
<head>
    <title>Inscription</title>
    <!-- Inclure Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Inclure Font Awesome pour les icônes -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <style>
        body {
            background: blueviolet;
            background-size: 400% 400%;
            animation: gradient 15s linear infinite;
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        @keyframes gradient {
            0% {
                background-position: 0% 50%;
            }
            50% {
                background-position: 100% 50%;
            }
            100% {
                background-position: 0% 50%;
            }

        }

        .container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.3);
            max-width: 500px;
            width: 100%;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
        }

        form {
            text-align: center;
        }

        label {
            font-weight: bold;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 15px;
            margin-bottom: 30px;
            border: 2px solid #ced4da;
            border-radius: 5px;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            padding: 15px 30px;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        p {
            text-align: center;
            margin-top: 20px;
        }

        a {
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        /* Style pour les icônes */
        .icon {
            font-size: 24px;
            margin-right: 10px;
        }
    </style>
    <script>
        function t(){
            alert("Inscription avec succes");
            return true;
        }
    </script>
</head>
<body>
    <div class="container">
        <h1><i class="fas fa-user-plus"></i> Inscription</h1>
        <form action="InscriptionController" method="post">
            <div class="form-group">
                <label for="newUsername"><i class="fas fa-user icon"></i> Nom d'utilisateur</label>
                <input type="text" class="form-control" id="newUsername" name="newUsername" required>
            </div>

            <div class="form-group">
                <label for="newPassword"><i class="fas fa-lock icon"></i> Mot de passe</label>
                <input type="password" class="form-control" id="newPassword" name="newPassword" required>
            </div>
            
            <div class="form-group">
                <label for="role"><i class="fa fa-address-card"></i> Role</label>
                <select name="role" class="form-control">
                    <option value="true">Employee</option>
                    <option value="false">Etudiant</option>
                </select>
            </div>

            <div class="form-group">
                <button type="submit" class="btn btn-primary" onsubmit="t()">S'inscrire</button>
            </div>
        </form>

        <p>Déjà inscrit ? <a href="login.jsp">Se connecter</a></p>
    </div>

    <!-- Inclure Font Awesome pour les icônes -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"></script>
</body>
</html>
