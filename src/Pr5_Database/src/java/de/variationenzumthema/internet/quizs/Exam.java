package de.variationenzumthema.internet.quizs;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * Quizs: Exam
 *
 * The exam is a bunch of questions.  The exam has ...
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
@Entity
@Table(name = "Exam")
public class Exam {
    
    @Id
    private String examName;

    // if you want a question to be available in two different tests this can not be OneToOne
    @ManyToMany
    private List<Question> questions;
    
    /**
     * Hibernate needs a default constructor.
     */
    public Exam() {
        super();
        this.questions = new ArrayList<Question>();
    }

    public Exam(String examName) {
        this();
        this.examName = examName;
    }

    public String getExamName() {
        return examName;
    }

    public void setExamName(String examName) {
        this.examName = examName;
    }

    public List<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(List<Question> questions) {
        this.questions = questions;
    }

    public void addQuestion(Question question) {
        this.questions.add(question);
    }
    
    @Override
    public String toString() {
        return "Exam{" + "examName=" + examName + ", questions=" + questions + '}';
    }
    
}
