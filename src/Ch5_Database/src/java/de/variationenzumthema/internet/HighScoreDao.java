package de.variationenzumthema.internet;

import java.util.List;
import org.hibernate.Session;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * Generic data access object used to interact with database.
 * 
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
public class HighScoreDao {
 
    private Session hibSession = null;

    public HighScoreDao() {
        this.hibSession = HibernateUtil.getSessionFactory().openSession();
    }

    public void save(HighScore entity) {
        hibSession.beginTransaction();
        hibSession.save(entity);
        hibSession.getTransaction().commit();
    }

    public void persist(HighScore entity) {
        hibSession.beginTransaction();
        hibSession.persist(entity);
        hibSession.getTransaction().commit();
    }

    public void delete(HighScore entity) {
        hibSession.beginTransaction();
        hibSession.delete(entity);
        hibSession.getTransaction().commit();
    }

    public HighScore merge(HighScore entity) {
        hibSession.beginTransaction();
        HighScore e = (HighScore) hibSession.merge(entity);
        hibSession.getTransaction().commit();
        return e;
    }

    public HighScore findById(String id) {
        return (HighScore) hibSession.get("HighScore", id);
    }

    @SuppressWarnings("unchecked")
    public List<HighScore> findAll() {
        return hibSession.createQuery("Select e From HighScore e").list();
    }
}
