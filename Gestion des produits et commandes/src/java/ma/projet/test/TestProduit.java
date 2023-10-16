/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ma.projet.test;

import java.util.Date;
import ma.projet.entities.Categorie;
import ma.projet.entities.Produit;
import ma.projet.services.CategorieService;
import ma.projet.services.ProduitService;

/**
 *
 * @author Lachgar
 */
public class TestProduit {

    public static void main(String[] args) {

        ProduitService ps = new ProduitService();
        CategorieService cs = new CategorieService();

        cs.create(new Categorie("pc", "pc"));
        cs.create(new Categorie("tele", "tele"));
        cs.create(new Categorie("tv", "television"));
        cs.create(new Categorie("machine", "machine"));
        cs.create(new Categorie("imprimante", "imprimante"));
        ps.create(new Produit("produit1", 200, 10,cs.getById(1)));
        ps.create(new Produit("produit2", 300, 3,cs.getById(2)));
        ps.create(new Produit("produit3", 400,5, cs.getById(3)));
        ps.create(new Produit("produit4", 500,1, cs.getById(4)));
       
    }

}
