<%@page import="ma.projet.entities.Produit"%>
<%@ page import="ma.projet.entities.Personne" %>
<%@ page import="java.util.List" %>
<%@ page import="ma.projet.services.ProduitService" %>
<%@ page import="ma.projet.services.PersonneService" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Accueil</title>
    <!-- Ajout de Bootstrap -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Augmenter la taille de la police pour tous les éléments */
        body, h1, h2, p, th, td, input, button {
            font-size: 30px;
        }

        /* Augmenter les dimensions de tous les composants */
        .container {
            padding: 30px;
        }

        /* Centrer le bouton "Se déconnecter" */
        .logout-button-container {
            text-align: center;
        }

        /* Augmenter la taille de la police de tous les boutons */
        button {
            font-size: 30px;
        }
    </style>
</head>
<body>

    <%
        // Récupérer l'ID du client connecté depuis la session
        String username = (String) request.getSession().getAttribute("username");
        PersonneService personneService = new PersonneService();
        Personne client = personneService.getByUsername(username);
    %>
    
    <div class="container">
        <h1 class="mt-5">Bienvenue, <%= client.getUserName() %></h1>
        
        <table class="table table-striped mt-4">
            <thead>
                <tr>
                    <th scope="col">Nom du Produit</th>
                    <th scope="col">Prix</th>
                    <th scope="col">qstock</th>
                    <th scope="col">Quantité</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    ProduitService produitService = new ProduitService();
                    List<Produit> produits = produitService.findAll();
                    
                    for (Produit produit : produits) {
                %>
                <tr>
                    <td><%= produit.getReference() %></td>
                    <td><%= produit.getPrix() %></td>
                    <td><%= produit.getqStock() %></td>
                    <td>
                        <input class="quantite form-control" type="number" min="1" max="<%= produit.getqStock() %>" id="quantite_<%= produit.getReference() %>">
                    </td>
                    <td>
                        <button class="btn btn-primary" onclick="ajouterAuPanier('<%= produit.getReference() %>', '<%= produit.getPrix() %>')">Ajouter au panier</button>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <div class="mt-5">
            <h2>Panier</h2>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">Nom du Produit</th>
                        <th scope="col">Prix</th>
                        <th scope="col">Quantité</th>
                    </tr>
                </thead>
                <tbody id="panierTable">
                    <!-- Le contenu du panier sera ajouté ici dynamiquement -->
                </tbody>
            </table>
            
            <form action="CommandeCo" method="post">
                <input type="hidden" name="op" value="createCommande">
                <input type="hidden" name="clientId" value="<%= client.getId() %>">
                <input type="text" name="code" placeholder="Code de commande" required class="form-control mb-2">
                <button type="submit" class="btn btn-success">Confirmer le panier</button>
            </form>
        </div>
    </div>
    
    <div class="logout-button-container">
        <p class="mt-5"><a href="login.jsp" class="btn btn-danger logout-button">Se déconnecter</a></p>
    </div>
    
    <script>
        var panier = [];

        function ajouterAuPanier(reference, prix) {
            var inputQuantite = document.getElementById('quantite_' + reference);
            var quantite = inputQuantite.value;
            var produit = {
                reference: reference,
                prix: prix,
                quantite: quantite
            };

           
            panier.push(produit);
            
           
            var panierTable = document.getElementById("panierTable");
            var newRow = panierTable.insertRow();
            var cell1 = newRow.insertCell(0);
            var cell2 = newRow.insertCell(1);
            var cell3 = newRow.insertCell(2);
            cell1.innerHTML = reference;
            cell2.innerHTML = prix;
            cell3.innerHTML = quantite;

            alert("Produit ajouté au panier avec succès !");
        }
        
        document.querySelector("form").addEventListener("keypress", function (e) {
            if (e.keyCode === 13) {
                e.preventDefault();
            }
        });
    </script>
</body>
</html>
