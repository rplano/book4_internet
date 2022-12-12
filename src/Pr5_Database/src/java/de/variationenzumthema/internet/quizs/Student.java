package de.variationenzumthema.internet.quizs;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * Quizs: Student
 *
 * A student can take one or more exams.  The student has an emailId and set of exam results.
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
@Entity
@Table(name = "Student")
public class Student {
    
    @Id
    private String emailId;
    
    @OneToMany
    private Set<Result> examResults;
    
    /**
     * Hibernate needs a default constructor.
     */
    public Student() {
        super();
        this.examResults = new HashSet<Result>();
    }

    public Student(String emailId) {
        this();
        this.emailId = emailId;
    }

    public String getEmailId() {
        return emailId;
    }

    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }

    public Set<Result> getExamResults() {
        return examResults;
    }

    public void setExamResults(Set<Result> examResults) {
        this.examResults = examResults;
    }
    
    public void addExamResults(Result examResult) {
        this.examResults.add(examResult);
    }

    @Override
    public String toString() {
        return "Student{" + "emailId=" + emailId + ", examResults=" + examResults + '}';
    }
}
