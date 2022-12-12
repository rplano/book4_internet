package de.variationenzumthema.internet.quizs;

import java.util.Date;
import java.util.Map;
import java.util.TreeMap;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * Quizs: Result
 *
 * The result of an exam taken.  The result has ...
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
@Entity
@Table(name = "Result")
public class Result {
     
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @OneToOne
    private Exam exam;
    
    @ElementCollection
    @Column(nullable = true)
    private Map<Long,Integer> questionIdAnswerIdMap;
    
    @Column(nullable = false)
    private Date dateTestTaken;
    
    /**
     * Hibernate needs a default constructor.
     */
    public Result() {
        super();
        this.questionIdAnswerIdMap = new TreeMap<Long,Integer>();
    }

    public Result(Exam exam, Date dateTestTaken) {
        this();
        this.exam = exam;
        this.dateTestTaken = dateTestTaken;        
    }

    public Long getId() {
        return id;
    }

    public Exam getExam() {
        return exam;
    }

    public Map<Long, Integer> getQuestionIdAnswerIdMap() {
        return questionIdAnswerIdMap;
    }

    public void setQuestionIdAnswerIdMap(Map<Long, Integer> questionIdAnswerIdMap) {
        this.questionIdAnswerIdMap = questionIdAnswerIdMap;
    }
    
    public void addToQuestionIdAnswerIdMap(String questionId, String answerId) {
        addToQuestionIdAnswerIdMap(Long.parseLong(questionId), Integer.parseInt(answerId));
    }
    
    public void addToQuestionIdAnswerIdMap(Long questionId, Integer answerId) {
        this.questionIdAnswerIdMap.put(questionId, answerId);
    }

    public Date getDateTestTaken() {
        return dateTestTaken;
    }

    public void setDateTestTaken(Date dateTestTaken) {
        this.dateTestTaken = dateTestTaken;
    }

    @Override
    public String toString() {
        return "Result{" + "id=" + id + ", questionIdAnswerIdMap=" + questionIdAnswerIdMap + ", dateTestTaken=" + dateTestTaken + '}';
    }
}
