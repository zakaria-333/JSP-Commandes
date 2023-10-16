
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ma.projet.entities.Produit;
import ma.projet.services.ProduitService;

@WebServlet(name = "PanierController", urlPatterns = {"/PanierController"})
public class PanierController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("op") != null) {
            String op = request.getParameter("op");
            if (op.equals("ajouter")) {
                String idProduit =  request.getParameter("idProduit");
                Produit produit = new ProduitService().getById(Integer.parseInt(idProduit));
                if (produit != null) {
                    // Ajoutez le produit au panier dans la session
                    List<Produit> panier = (List<Produit>) request.getSession().getAttribute("panier");
                    if (panier == null) {
                        panier = new ArrayList<>();
                        request.getSession().setAttribute("panier", panier);
                    }
                    panier.add(produit);
                }
            }
        }
    }
}
