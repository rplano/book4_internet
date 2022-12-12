package de.variationenzumthema.internet.quizs;

import de.variationenzumthema.internet.GenericDao;
import java.util.ArrayList;
import java.util.List;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * ExamDao
 *
 * Data access object used to interact with database.
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
public class ExamDao extends GenericDao<String, Exam>  {
    
    public ExamDao() {
        super();
    }
    
    public void initDatabase(QuestionDao qstnDao) {
        List<String> anss1 = new ArrayList<String>();
        anss1.add("1");
        anss1.add("2");
        anss1.add("4");
        Question q1 = new Question("What is 1 + 1?", anss1, 2);
        qstnDao.save(q1);
        
        List<String> anss2 = new ArrayList<String>();
        anss2.add("red");
        anss2.add("black");
        anss2.add("blue");
        Question q2 = new Question("Which color is the sky?", anss2, 3);
        qstnDao.save(q2);
        
        Exam ex = new Exam("Simple Exam");
        ex.addQuestion(q1);
        ex.addQuestion(q2);
        save(ex);
    }
}
