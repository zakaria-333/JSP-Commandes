<%@page import="ma.projet.entities.LigneCommandeProduit"%>
<%@page import="java.util.List"%>
<%@page import="ma.projet.services.ProduitService"%>
<%@page import="ma.projet.services.PersonneService"%>
<%@page import="ma.projet.entities.Personne"%>
<%@page import="ma.projet.entities.Produit"%>
<%@page import="ma.projet.services.CommandeService"%>
<%@page import="ma.projet.services.CategorieService"%>
<%@page import="ma.projet.entities.Commande"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Commande Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <!-- Inclure Bootstrap JavaScript (jQuery requis) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <style>
            /* Personnalisation du style pour remplir 90% de l'écran */
            
            .produit-row{
                font-size:30px
            }
            .custom-container {
                width: 90%;
                margin: auto;
            }
            legend{
                text-align: center;
                font-size: 50px;
                margin: 60px;
            }
            td{

                font-size: 20px;

            }
            fieldset {
                border: 3px solid #ddd;
                padding: 10px;
            }

            .modal-content h5.modal-title {
                font-size: 30px;/* Ajustez la taille de la police du titre de la modale */
            }

            .modal-content .modal-body {
                font-size:26px;
            }

            .modal-content .modal-footer button {
                font-size: 26px;
            }
        </style>

    </head>
    <body>
        <aside id="sidebar-multi-level-sidebar" class="fixed top-0 left-0 z-40 w-96 h-screen transition-transform -translate-x-full sm:translate-x-0 bg-black" aria-label="Sidebar">
            <div class="h-full px-6 py-8 overflow-y-auto bg-black dark:bg-gray-800">
                <ul class="space-y-6 font-semibold">
                    <li>
                        <a href="Produit.jsp" class="flex items-center p-6 text-3xl text-white rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 group">
                            <svg class="w-12 h-12 text-white transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 21">
                            <path d="M16.975 11H10V4.025a1 1 0 0 0-1.066-.998 8.5 8.5 0 1 0 9.039 9.039.999.999 0 0 0-1-1.066h.002Z" fill="white" />
                            <path d="M15 12a1 1 0 0 0 .962-.726l2-7A1 1 0 0 0 17 3H3.77L3.175.745A1 1 0 0 0 2.208 0H1a1 1 0 0 0 0 2h.438l.6 2.255v.019l2 7 .746 2.986A3 3 0 1 0 9 17a2.966 2.966 0 0 0-.184-1h2.368c-.118.32-.18.659-.184 1a3 3 0 1 0 3-3H6.78l-.5-2H15Z" fill="white" />
                            </svg>
                            <span class="ml-8">Produits</span>
                        </a>
                    </li>

                    <li>
                        <a href="Commande.jsp" class="flex items-center p-6 text-3xl text-white rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 group">
                            <svg class="w-12 h-12 text-white transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 18">
                            <path d="M14 2a3.963 3.963 0 0 0-1.4.267 6.439 6.439 0 0 1-1.331 6.638A4 4 0 1 0 14 2Z" fill="white" />
                            <path d="M10 4a4 4 0 1 1-8 0 4 4 0 0 1 8 0Z" fill="white" />
                            </svg>
                            <span class="ml-8">Commandes</span>
                        </a>
                    </li>
                    <li>
                        <a href="Categorie.jsp" class="flex items-center p-6 text-3xl text-white rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 group">
                            <svg class="w-12 h-12 text-white transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 18 20">
                            <path d="M17 5.923A1 1 0 0 0 16 5h-3V4a4 4 0 1 0-8 0v1H2a1 1 0 0 0-1 .923L.086 17.846A2 2 0 0 0 2.08 20h13.84a2 2 0 0 0 1.994-2.153L17 5.923Z" fill="white" />
                            <path d="M10 9a1 1 0 1 0 0-2 1 1 0 0 0 0 2Z" fill="white" />
                            <path d="M10 4a2 2 0 1 0 0 4 2 2 0 0 0 0-4Z" fill="white" />
                            </svg>
                            <span class="ml-8">Categories</span>
                        </a>
                    </li>
                    <li>
                        <a href="Personne.jsp" class="flex items-center p-6 text-3xl text-white rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 group">
                            <svg class="w-12 h-12 text-white transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 16">
                            <path stroke="white" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 2a3.963 3.963 0 0 0-1.4.267 6.439 6.439 0 0 1-1.331 6.638A4 4 0 1 0 14 2Zm1 9h-1.264A6.957 6.957 0 0 1 15 15v2a2.97 2.97 0 0 1-.184 1H19a1 1 0 0 0 1-1v-1a5.006 5.006 0 0 0-5-5ZM6.5 9a4.5 4.5 0 1 0 0-9 4.5 4.5 0 0 0 0 9ZM8 10H5a5.006 5.006 0 0 0-5 5v2a1 1 0 0 0 1 1h11a1 1 0 0 0 1-1v-2a5.006 5.006 0 0 0-5-5Z" />
                            </svg>
                            <span class="ml-8">Personnes</span>
                        </a>
                    </li>
                    <li>
                        <a href="login.jsp" class="flex items-center p-6 text-3xl text-white rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 group">
                            <svg class="w-12 h-12 text-white transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 16">
                            <path stroke="white" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 8h11m0 0L8 4m4 4-4 4m4-11h3a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2h-3" />
                            </svg>
                            <span class="ml-8">Se déconnecté</span>
                        </a>
                    </li>
                </ul>
            </div>
        </aside>
        <script>
            function afficherPopup(id) {
                document.getElementsByName("id")[0].value = id;
                var popup = document.getElementById("listeProduitsPopup");
                popup.style.display = "block";
            }

            function fermerPopup() {
                var popup = document.getElementById("listeProduitsPopup");
                popup.style.display = "none";
            }

            function afficherProduitPopup(id) {
                document.getElementsByName("id")[0].value = id;
                $(document).ready(function () {
                    // Remplacez 7 par la valeur de votre choix
                    $.ajax({
                        type: "POST",
                        url: "CommandeController?op=afficherProduitsDeCommande&id=" + id,
                        data: {id: id},
                        success: function (response) {
                            $("#l").html(response)
                            // Le code ici sera exécuté lorsque la requête au serveur aura réuss
                        }
                    });
                });
                var popup = document.getElementById("listeProduitsPopupDeCommande");
                popup.style.display = "block";
            }

            function fermerProduitPopup() {
                var popup = document.getElementById("listeProduitsPopupDeCommande");
                popup.style.display = "none";
            }
            function validateForm() {
                var code = document.getElementsByName("code")[0].value;
                var date = document.getElementsByName("date")[0].value;
                var client = document.getElementsByName("client")[0].value;
                var id = document.getElementsByName("id")[0].value;
                var valider = document.getElementsByName("valider")[0].value;

                // Vérifier si les champs Code et Libelle sont vides
                if (code.trim() === '') {
                    alert("Les champs ne peuvent pas être vides.");
                    return false; // Empêcher la soumission du formulaire
                }

                // Vérifier la valeur du bouton "valider"
                if (valider === "Modifier") {
                    // Si le bouton est "Modifier", rediriger avec l'ID
                    window.location.href = "CommandeController?op=update&id=" + id + "&code=" + code + "&date=" + date + "&client=" + client;
                    ;
                    return false; // Empêcher la soumission du formulaire
                } else if (valider === "Ajouter") {
                    // Si le bouton est "Ajouter", permettre la soumission du formulaire
                    return true;
                }

                // Si aucune des conditions précédentes n'est satisfaite, par défaut, empêcher la soumission du formulaire
                return false;
            }

            function confirmDelete(id, code) {
                var confirmation = confirm("Etes-vous sûr de vouloir supprimer la commande " + code + " ?");
                if (confirmation) {
                    // User confirmed, redirect to the delete URL
                    window.location.href = "CommandeController?op=delete&id=" + id;
                }
            }
            function updateCommande(id, code, date, client) {
                document.getElementsByName("code")[0].value = code;
                document.getElementsByName("client")[0].value = client;
                document.getElementsByName("date")[0].value = date;
                document.getElementsByName("id")[0].value = id;
                document.getElementsByName("valider")[0].value = "Modifier";
            }

            function addProductToCommande(produit_id) {
                var id = document.getElementsByName("id")[0].value;
                var quantite = document.getElementsByName("quantite")[0].value;
                window.location.href = "CommandeController?op=ajouterProduit&commande=" + id + "&produit=" + produit_id + "&quantite=" + quantite;
                alert("Produit ajouté avec succés");
            }
            function supprimerProduitDeCommande(produit, commande, quantite) {
                window.location.href = "CommandeController?op=supprimerProduit&commande=" + commande + "&produit=" + produit + "&quantite=" + quantite;
                alert("Produit supprimé de la commande avec succés");

            }

        </script>
        <div class="modal fade" id="confirmDeleteModal" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-danger text-white">
                        <h5 class="modal-title" id="confirmDeleteModalLabel">Confirmation de la suppression</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Êtes-vous sûr de vouloir supprimer ce produit ?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded" id="confirmDeleteBtn">Confirmer la suppression</button>
                        <button type="button" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" data-dismiss="modal">Annuler</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="container mt-2 p-5" style="margin-top: 80px; margin-left: 400px;">
            <form action="CommandeController" onsubmit="return validateForm()">
                <fieldset class="p-3 mb-2">
                    <legend class="mb-4">Gestion des Commandes</legend>
                    <div class="form-group row">
                        <label style="font-size:30px" for="code" class="col-sm-2 col-form-label text-center">Code:</label>
                        <div class="col-sm-6 mx-auto">
                            <input style="font-size:30px" type="text" class="form-control" name="code" id="code" value="" />
                        </div>
                        <input  type="text" name="id" value="" hidden/>
                    </div>
                    <div class="form-group row">
                        <label style="font-size:30px" for="date" class="col-sm-2 col-form-label text-center">Date:</label>
                        <div class="col-sm-6 mx-auto">
                            <input style="font-size:30px" type="date" class="form-control" name="date" value="" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label style="font-size:30px" for="client" class="col-sm-2 col-form-label text-center">Client:</label>
                        <div class="col-sm-6 mx-auto">
                            <select class="form-control" name="client" style="font-size:30px">
                                <%
                                    PersonneService ps = new PersonneService();
                                    for (Personne c : ps.getClients()) {
                                %>
                                <option value="<%= c.getId()%>"><%= c.getUserName()%></option>
                                <% } %>
                            </select>
                        </div>
                    </div>
                    <div class="text-center">
                        <input style="font-size:30px" type="submit" class="btn btn-primary btn-lg bg-blue-500 text-white" value="Ajouter" name="valider" />



                    </div>

                </fieldset>
            </form>

            <fieldset class="p-3">
                <legend>Liste des commandes</legend>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th style="font-size:30px">Code</th>
                            <th style="font-size:30px">Date</th>
                            <th style="font-size:30px">Client</th>
                            <th style="font-size:30px">Voir les produits</th>
                            <th style="font-size:30px">Ajouter un produit</th>
                            <th style="font-size:30px">Supprimer</th>
                            <th style="font-size:30px">Modifier</th>

                        </tr>
                    </thead>
                    <tbody>
                        <%

                            CommandeService cs = new CommandeService();
                            for (Commande c : cs.findAll()) {
                        %>
                        <tr>
                            <td style="font-size:30px"><%= c.getCode()%></td>
                            <td style="font-size:30px"><%= c.getDate()%></td>
                            <td style="font-size:30px"><%= c.getClient().getUserName()%></td>
                            <td><button style="font-size:30px" type="button" class="btn btn-primary bg-blue-500 text-white" onclick="afficherProduitPopup(<%=c.getId()%>)">Voir les produits</button></td>
                            <td><button style="font-size:30px" type="button" class="btn btn-primary bg-blue-500 text-white" onclick="afficherPopup(<%=c.getId()%>)">Ajouter un produit</button></td>
                            <td><button style="font-size:30px" type="button" class="btn btn-primary bg-blue-500 text-white" onclick="confirmDelete(<%=c.getId()%>, '<%=c.getCode()%>')">Supprimer</button>
                            </td>
                            <td><button style="font-size:30px" type="button" class="btn btn-primary bg-blue-500 text-white" onclick="updateCommande(<%=c.getId()%>, '<%=c.getCode()%>', '<%=c.getDate()%>', <%= c.getClient().getId()%>)">Modifier</button>
                            </td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </fieldset>
        </div>
        
        




                    
                    
                    
                    <div id="listeProduitsPopupDeCommande" class="container mt-2 p-5" style="display: none; margin-top: 80px; margin-left: 400px;">
    <fieldset class="p-3">
        <legend>Produits de la commandes</legend>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th style="font-size:30px" class="mx-3">Reference</th>
                    <th style="font-size:30px" class="mx-3">Prix</th>
                    <th style="font-size:30px" class="mx-3">Categorie</th>
                    <th style="font-size:30px" class="mx-3">Quantité</th>
                    <th style="font-size:30px" class="mx-3">Supprimer</th>
                </tr>
            </thead>
            <tbody id="l">
                <!-- Add your table data here -->
            </tbody>
        </table>
        <button style="font-size:30px" type="button" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded" onclick="fermerProduitPopup()">Fermer</button>
    </fieldset>
</div>

<div id="listeProduitsPopup" class="container mt-2 p-5" style="display: none; margin-top: 80px; margin-left: 400px;">
    <fieldset class="p-3">
        <legend>Liste des produits Disponible</legend>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th style="font-size:30px">Reference</th>
                    <th style="font-size:30px">Prix</th>
                    <th style="font-size:30px">Quantité stockée</th>
                    <th style="font-size:30px">Categorie</th>
                    <th style="font-size:30px">Quantité</th>
                    <th style="font-size:30px">Ajouter à la commande</th>
                </tr>
            </thead>
            <tbody>
                <tbody>
                        <%

                            ProduitService pps = new ProduitService();
                            for (Produit p : pps.findAll()) {
                        %>
                        <tr>
                            <td style="font-size:30px"><%= p.getReference()%></td>
                            <td style="font-size:30px"><%= p.getPrix()%></td>
                            <td style="font-size:30px"><%= p.getqStock()%></td>
                            <td style="font-size:30px"><%= p.getCategorie().getLibelle()%></td>
                            <td><input type="number" name="quantite" value="1" class="form-control" /></td>
                            <td><button  style="font-size:30px" type="button" class="btn btn-primary bg-blue-500 text-white" onclick="addProductToCommande(<%=p.getId()%>)">Ajouter</button>

                        </tr>
                        <%}%>
                    </tbody>
            </tbody>
        </table>
        <button style="font-size:30px" type="button" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded" onclick="fermerPopup()">Fermer</button>
    </fieldset>
</div>

    </body>
</html>