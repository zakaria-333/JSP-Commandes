/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ma.projet.entities;

import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

/**
 *
 * @author ayoub mechkour
 */
@Entity
public class Personne {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String userName;
    private String mdp;
    private boolean isAdmin;
    
    @OneToMany
    @JoinColumn(name="client_id")
    private List<Commande> commandeClients;

    public Personne() {
    }

    public Personne(String userName, String mdp, boolean isAdmin) {
        this.userName = userName;
        this.mdp = mdp;
        this.isAdmin = isAdmin;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getMdp() {
        return mdp;
    }

    public void setMdp(String mdp) {
        this.mdp = mdp;
    }

    public boolean isIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    public List<Commande> getCommandeClients() {
        return commandeClients;
    }

    public void setCommandeClients(List<Commande> commandeClients) {
        this.commandeClients = commandeClients;
    }
    
    
    
    
}
