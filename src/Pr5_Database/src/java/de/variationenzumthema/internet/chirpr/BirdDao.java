package de.variationenzumthema.internet.chirpr;

import de.variationenzumthema.internet.GenericDao;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * BirdDao
 *
 * Data access object used to interact with database.
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
public class BirdDao extends GenericDao<String, Bird> {

    public BirdDao() {
        super();
    }

    public Bird getBird(String emailId) {
        Bird brd = findById(emailId);
        if (brd == null) {
            brd = new Bird(emailId);
            save(brd);
        }
        return brd;
    }
}
