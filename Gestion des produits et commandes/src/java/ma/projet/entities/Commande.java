/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ma.projet.entities;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedNativeQuery;
import javax.persistence.NamedQuery;
import javax.persistence.Temporal;
import org.hibernate.annotations.ManyToAny;

/**
 *
 * @author Lachgar
 */
@Entity
public class Commande {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date date;
    
    private String code;
    
    @ManyToOne
    private Personne client;

    public Commande() {
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Personne getClient() {
        return client;
    }

    public void setClient(Personne client) {
        this.client = client;
    }

    public Commande(Date date, String code , Personne client) {
        this.date = date;
        this.code = code;
        this.client = client;
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
    
    
}
