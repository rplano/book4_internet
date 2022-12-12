package de.variationenzumthema.internet.quizs;

import de.variationenzumthema.internet.GenericDao;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * QuestionDao
 *
 * Data access object used to interact with database.
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
public class QuestionDao extends GenericDao<Long, Question>  {
    
    public QuestionDao() {
        super();
    }
}
