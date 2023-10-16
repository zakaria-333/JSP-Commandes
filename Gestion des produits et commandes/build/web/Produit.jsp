<%-- 
    Document   : Produit
    Created on : 6 oct. 2023, 19:15:36
    Author     : ayoub mechkour
--%>

<%@page import="ma.projet.entities.Categorie"%>
<%@page import="ma.projet.services.ProduitService"%>
<%@page import="ma.projet.services.CategorieService"%>
<%@page import="ma.projet.entities.Produit"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Produit Page</title>
        <!-- Inclure Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <!-- Inclure Bootstrap JavaScript (jQuery requis) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
         <script src="https://cdn.tailwindcss.com"></script>
        <style>
            /* Personnalisation du style pour remplir 90% de l'écran */
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
        <script>
            function validateForm() {
                var prix = document.getElementsByName("prix")[0].value;
                var qStock = document.getElementsByName("qStock")[0].value;
                var ref = document.getElementsByName("ref")[0].value;
                var categorie = document.getElementsByName("categorie")[0].value;
                var id = document.getElementsByName("id")[0].value;
                var valider = document.getElementsByName("valider")[0].value;

                // Vérifier si les champs Code et Libelle sont vides
                if (ref.trim() === '' && prix.toString().trim() === '' && qStock.toString().trim() === '') {
                    alert("Les champs ne peuvent pas être vides.");
                    return false; // Empêcher la soumission du formulaire
                }

                // Vérifier la valeur du bouton "valider"
                if (valider === "Modifier") {
                    // Si le bouton est "Modifier", rediriger avec l'ID
                    window.location.href = "ProduitController?op=update&id=" + id + "&prix=" + prix + "&qStock=" + qStock + "&categorie=" + categorie + "&reference=" + ref;
                    ;
                    return false; // Empêcher la soumission du formulaire
                } else if (valider === "Ajouter") {
                    // Si le bouton est "Ajouter", permettre la soumission du formulaire
                    return true;
                }

                // Si aucune des conditions précédentes n'est satisfaite, par défaut, empêcher la soumission du formulaire
                return false;
            }

            
            function updateProduit(id, ref, prix, qStock, categorie) {
                document.getElementsByName("prix")[0].value = prix;
                document.getElementsByName("qStock")[0].value = qStock;
                document.getElementsByName("ref")[0].value = ref;
                document.getElementsByName("categorie")[0].value = categorie;

                document.getElementsByName("id")[0].value = id;
                document.getElementsByName("valider")[0].value = "Modifier";
            }

        </script>


        
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


        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        <!-- Modal de confirmation de suppression -->
        <div class="modal fade" id="confirmDeleteModal" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered "  role="document">
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
                        <button type="button" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded" id="confirmDeleteBtnPersonne">Confirmer la suppression</button>
<button type="button" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" data-dismiss="modal">Annuler</button>

                    </div>
                </div>
            </div>
        </div>




        <div class="container mt-4 p-5" style="margin-top: 80px; margin-left: 400px;">
            <form action="ProduitController" onsubmit="return validateForm()" id="categorieForm">
                <fieldset class="p-3">
                    <legend class="mb-4">Gestion des Produits</legend>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="ref"style="font-size:30px">Référence :</label>
                                <input type="text" class="form-control" name="ref" value=""style="font-size:30px" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="prix" style="font-size:30px">Prix :</label>
                                <input type="number" class="form-control" name="prix" value=""style="font-size:30px" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="qStock" style="font-size:30px">Quantité en stock :</label>
                                <input type="number" class="form-control" name="qStock" value="" style="font-size:30px" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="categorie" style="font-size:30px">Catégorie :</label>
                                <select class="form-control" name="categorie" style="font-size:30px">
                                    <%
                                        CategorieService cs = new CategorieService();
                                        for (Categorie c : cs.findAll()) {
                                    %>
                                    <option style="font-size:30px" value="<%= c.getId()%>"><%= c.getLibelle()%></option>
                                    <% } %>
                                </select>
                            </div>
                        </div>
                    </div>
                    <input type="text" name="id" value="" hidden style="font-size:30px"/>
                    <div class="text-center">
                        <input style="font-size:30px" type="submit" class="btn btn-lg bg-blue-500 text-white" value="Ajouter" name="valider" />

                        

                    </div>
                </fieldset>
            </form>

            <fieldset class="mt-4">
                <legend>Liste des produits</legend>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th style="font-size:30px">Reference</th>
                            <th style="font-size:30px">Prix</th>
                            <th style="font-size:30px">Quantité en stock</th>
                            <th style="font-size:30px">Categorie</th>
                            <th style="font-size:30px">Supprimer</th>
                            <th style="font-size:30px" >Modifier</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ProduitService ps = new ProduitService();
                            for (Produit p : ps.findAll()) {
                        %>
                        <tr>
                            <td style="font-size:30px"><%= p.getReference()%></td>
                            <td style="font-size:30px"><%= p.getPrix()%></td>
                            <td style="font-size:30px"><%= p.getqStock()%></td>
                            <td style="font-size:30px"><%= p.getCategorie().getLibelle()%></td>
                            <td style="font-size:30px">
                       <button style="font-size:30px" type="button" class="btn btn-danger bg-red-500 text-white" data-toggle="modal" data-target="#confirmDeleteModal" data-id="<%=p.getId()%>">Supprimer</button>

                            </td>

                          <td>
    <button style="font-size:30px" type="button" class="btn btn-primary bg-blue-500 text-white" onclick="updateProduit(<%=p.getId()%>, '<%=p.getReference()%>', <%=p.getPrix()%>, <%= p.getqStock()%>, <%= p.getCategorie().getId()%>)">Modifier</button>
</td>

                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </fieldset>
        </div>
        <script>
            // Gestionnaire d'événements lorsque le bouton de suppression est cliqué
            $('button[data-toggle="modal"][data-target="#confirmDeleteModal"]').on('click', function () {
// Récupérer l'ID du produit à supprimer à partir de l'attribut data-id
                var productId = $(this).data('id');

// Configurer le bouton "Confirmer la suppression" dans la modal pour rediriger vers la suppression réelle
                $('#confirmDeleteBtn').on('click', function () {
                    window.location.href = "ProduitController?op=delete&id=" + productId;
                });
            });
        </script>

    </body>
</html>
