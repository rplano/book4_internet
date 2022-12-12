package de.variationenzumthema.internet.quizs;

import de.variationenzumthema.internet.GenericDao;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * StudentDao
 *
 * Data access object used to interact with database.
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
public class StudentDao extends GenericDao<String, Student>  {
    
    public StudentDao() {
        super();
    }
    
    /**
     * If student already exists, return it, otherwise create new one.
     * @return 
     */
    public Student getStudent(String emailId) {
        Student stdnt = findById(emailId);
        if (stdnt == null) {
            stdnt = new Student(emailId);
            save(stdnt);
        }
        return stdnt;
    }
    
    public void initDatabase() {
        Student st1 = new Student("ralph");
        save(st1);
        Student st2 = new Student("vince");
        save(st2);
    }
}
