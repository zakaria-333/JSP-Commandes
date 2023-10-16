/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ma.projet.services;

import java.util.ArrayList;
import java.util.List;
import ma.projet.dao.IDao;
import ma.projet.entities.Personne;
import ma.projet.entities.Personne;
import ma.projet.util.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Lachgar
 */
public class PersonneService implements IDao<Personne> {

    @Override
    public boolean update(Personne o) {
        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.update(o);
            tx.commit();
            return true;
        } catch (HibernateException ex) {
            if (tx != null) {
                tx.rollback();
            }
            return false;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    @Override
    public boolean delete(Personne o) {
        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.delete(o);
            tx.commit();
            return true;
        } catch (HibernateException ex) {
            if (tx != null) {
                tx.rollback();
            }
            return false;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    @Override
    public boolean create(Personne o) {
        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.save(o);
            tx.commit();
            return true;
        } catch (HibernateException ex) {
            if (tx != null) {
                tx.rollback();
            }
            return false;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    @Override
    public List<Personne> findAll() {
        List<Personne> personnes = null;
        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            personnes = session.createQuery("from Personne").list();
            tx.commit();
            return personnes;
        } catch (HibernateException ex) {
            if (tx != null) {
                tx.rollback();
            }
            return personnes;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    @Override
    public Personne getById(int id) {
        Personne personne = null;
        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            personne = (Personne) session.get(Personne.class, id);
            tx.commit();
            return personne;
        } catch (HibernateException ex) {
            if (tx != null) {
                tx.rollback();
            }
            return personne;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    public List<Personne> getClients() {
        List<Personne> personnes;
        List<Personne> clients = null;
        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            personnes = session.createQuery("from Personne").list();
            
            clients = new ArrayList<>();
            for (Personne personne : personnes) {
                if (!personne.isIsAdmin()) {
                    clients.add(personne);
                }
            }
            tx.commit();
            return clients;
        } catch (HibernateException ex) {
            if (tx != null) {
                tx.rollback();
            }
            return clients;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }
    public Personne getByUsername(String username) {
    PersonneService p = new PersonneService();
    List<Personne> C = p.findAll();
    for (Personne m : C) {
        if (m.getUserName().equals(username)) {
            return m;
        }
    }
    return null; 
}
    

}
