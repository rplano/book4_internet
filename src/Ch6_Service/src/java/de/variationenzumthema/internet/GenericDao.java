package de.variationenzumthema.internet;



import de.variationenzumthema.internet.HibernateUtil;
import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;
import java.util.logging.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Session;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * Generic data access object used to interact with database.
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
public class GenericDao<K extends Serializable, E> {

    private Logger logger = Logger.getLogger(this.getClass().getName());
    private Class<E> entityClass;
    private Session hibSession = null;

    public GenericDao() {
        this.hibSession = HibernateUtil.getSessionFactory().openSession();
        ParameterizedType genericSuperclass = (ParameterizedType) getClass().getGenericSuperclass();
        this.entityClass = (Class<E>) genericSuperclass.getActualTypeArguments()[1];
    }

    public void save(E entity) {
        try {
            hibSession.beginTransaction();
            hibSession.save(entity);
            hibSession.getTransaction().commit();
        } catch (HibernateException e) {
            hibSession.getTransaction().rollback();
            logger.severe(getClass().getName() + ".save(): " + e.getMessage());
        }
    }

    public void persist(E entity) {
        try {
            hibSession.beginTransaction();
            hibSession.persist(entity);
            hibSession.getTransaction().commit();
        } catch (HibernateException e) {
            hibSession.getTransaction().rollback();
            logger.severe(getClass().getName() + ".persist(): " + e.getMessage());
        }
    }

    public void delete(E entity) {
        try {
            hibSession.beginTransaction();
            hibSession.delete(entity);
            hibSession.getTransaction().commit();
        } catch (HibernateException e) {
            hibSession.getTransaction().rollback();
            logger.severe(getClass().getName() + ".delete(): " + e.getMessage());
        }
    }

    public E merge(E entity) {
        try {
            hibSession.beginTransaction();
            E e = (E) hibSession.merge(entity);
            hibSession.getTransaction().commit();
            return e;
        } catch (HibernateException e) {
            hibSession.getTransaction().rollback();
            logger.severe(getClass().getName() + ".merge(): " + e.getMessage());
        }
        return null;
    }

    public E findById(K id) {
        return (E) hibSession.get(entityClass, id);
    }

    public List<E> findAll() {
        return hibSession.createQuery("Select e From " + entityClass.getCanonicalName() + " e").list();
    }

    protected Session getHibernateSession() {
        return hibSession;
    }
}
