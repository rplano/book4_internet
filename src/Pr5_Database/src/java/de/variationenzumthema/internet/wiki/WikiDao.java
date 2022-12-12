package de.variationenzumthema.internet.wiki;

import de.variationenzumthema.internet.GenericDao;
import de.variationenzumthema.internet.Utility;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * WikiDao
 *
 * Data access object used to interact with database.
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
public class WikiDao extends GenericDao<String, WikiPage> {

    public WikiDao() {
        super();
    }
    
    public List<WikiPage> search(String searchTerm) {
        List<WikiPage> pageList = null;
        searchTerm = Utility.escapeSql(searchTerm);
        Query q = getHibernateSession().createQuery(
                "from WikiPage as pg where lower(pg.content) "
                        + "like lower('%"+searchTerm+"%') "
                        + "order by pg.pageId asc"
             );                 
        pageList = (List<WikiPage>) q.list();            
        return pageList;
    }

    /**
     * we want pages to be sorted, hence override default behavior
     */
    public List<WikiPage> findAll() {
        return getHibernateSession().createQuery("from WikiPage as pg order by pg.pageId asc").list();
    }
 
    public void initDatabase() {
        String homePage
                = "= Wiki =\n"
                + "Welcome to 'Wiki'.\n"
                + "\n"
                + "Help can be found under [[help]].\n"
                + "----\n";
        merge(new WikiPage("home", homePage));
        String helpPage
                = "= Help =\n"
                + "How to use this simple Wiki.  The following markup exists:\n"
                + "* '=' for heading (=, ==, === exist)\n"
                + "* '----' for horizontal line\n"
                + "* empty line for new line\n"
                + "* '*' for bulleted list\n"
                + "* \\[\\[...\\]\\] for links\n"
                + "That's it.";
        merge(new WikiPage("help", helpPage));
    }
}
