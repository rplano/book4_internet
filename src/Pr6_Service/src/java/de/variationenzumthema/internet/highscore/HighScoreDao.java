package de.variationenzumthema.internet.highscore;

import de.variationenzumthema.internet.GenericDao;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * HighScoreDao
 *
 * Data access object used to interact with database.
 * 
 * - should be a singleton!
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
public class HighScoreDao extends GenericDao<String, HighScore> {

    private static HighScoreDao instance;
    
    private HighScoreDao() {
        super();
    }
    
    public static HighScoreDao getInstance() {
        if (instance == null ) {
            instance = new HighScoreDao();
            instance.initDatabase();
        }
        return instance;
    }

    public void initDatabase() {
        HighScore hs1 = new HighScore("ralph", 42);
        HighScore hs2 = new HighScore("vince", 12);
        HighScore hs3 = new HighScore("frank", 12);
        save(hs1);
        save(hs2);
        save(hs3);
    }
}
