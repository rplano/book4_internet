package de.variationenzumthema.internet.chirpr;

import de.variationenzumthema.internet.GenericDao;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * UserDao
 *
 * Data access object used to interact with database.
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
public class ChirpDao extends GenericDao<Long, Chirp> {

    public ChirpDao() {
        super();
    }

    public void initDatabase(BirdDao brdDao,TagDao tagDao) {
        Bird bd1 = new Bird("ralph");
        brdDao.save(bd1);
        Bird bd2 = new Bird("vince");
        brdDao.save(bd2);
        
        Chirp cp1 = new Chirp("Welcome to #Chirpr");
        save(cp1);
        bd1.addChirp(cp1);
        tagDao.parseChirpForTags(cp1);
        
        Chirp cp2 = new Chirp("#Java is the greatest!");
        save(cp2);
        bd2.addChirp(cp2);
        tagDao.parseChirpForTags(cp2);
        
        Chirp cp3 = new Chirp("#Chirpr is written in #Java");
        save(cp3);
        bd2.addChirp(cp3);
        tagDao.parseChirpForTags(cp3);
        
        brdDao.merge(bd1);
        brdDao.merge(bd2);
    }
}
