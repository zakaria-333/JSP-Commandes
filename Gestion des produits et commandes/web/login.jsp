<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Connexion</title>
    <!-- Inclure Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Inclure Font Awesome pour les icônes -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <style>
        
        body {
           background: blanchedalmond;
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
            padding: 30px; /* Augmenter la marge intérieure */
            border-radius: 10px; /* Augmenter la bordure */
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.3); /* Augmenter l'ombre */
            max-width: 500px; /* Largeur maximale légèrement augmentée */
            width: 100%;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px; /* Augmenter la marge inférieure */
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
            padding: 15px; /* Augmenter la hauteur et la largeur de la zone de saisie */
            margin-bottom: 30px; /* Augmenter la marge inférieure */
            border: 2px solid #ced4da;
            border-radius: 5px; /* Augmenter l'arrondi des coins */
            font-size: 16px; /* Augmenter la taille de la police */
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            padding: 15px 30px; /* Augmenter la hauteur et la largeur du bouton */
            border: none;
            border-radius: 5px; /* Augmenter l'arrondi des coins */
            font-size: 18px; /* Augmenter la taille de la police */
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        p {
            text-align: center;
            margin-top: 20px; /* Augmenter la marge supérieure */
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
            font-size: 24px; /* Taille de l'icône */
            margin-right: 10px; /* Marge à droite de l'icône */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1> Connexion</h1>
        <c:if test="${not empty requestScope.message}">
            <div >${requestScope.message}</div>
        </c:if>

        <form action="AuthServlet" method="post">
            <div class="form-group">
                <label for="username"><i class="fas fa-user icon"></i> Nom d'utilisateur</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>

            <div class="form-group">
                <label for="password"><i class="fas fa-lock icon"></i> Mot de passe</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>

            <div class="form-group">
                <a href="Categorie.jsp"><input type="submit" class="btn btn-primary" value="Se connecter"></a>
            </div>
        </form>

        <p>Pas encore inscrit ? <a href="inscription.jsp">S'inscrire</a></p>
    </div>

    <!-- Inclure Font Awesome pour les icônes -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"></script>
</body>
</html>
