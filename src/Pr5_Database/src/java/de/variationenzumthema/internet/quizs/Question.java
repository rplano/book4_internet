package de.variationenzumthema.internet.quizs;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * Quizs: Question
 *
 * A chirp has a user and a text.
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
@Entity
@Table(name = "Question")
public class Question {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String question;
    
    @ElementCollection
    @Column(nullable = false)
    private List<String> answers;
    
    @Column(nullable = false)
    private Integer correctAnswer;

    /**
     * Hibernate needs a default constructor.
     */
    public Question() {
        super();
        this.answers = new ArrayList<String>();
    }

    public Question(String question, Integer correctAnswer) {
        this(question, new ArrayList<String>(), correctAnswer);
    }

    public Question(String question, List<String> answers, Integer correctAnswer) {
        this();
        this.question = question;
        this.answers = answers;
        this.correctAnswer = correctAnswer;
    }

    public Long getId() {
        return id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public List<String> getAnswers() {
        return answers;
    }

    public void setAnswers(List<String> answers) {
        this.answers = answers;
    }
    
    public void addAnswer(String answer) {
        answers.add(answer);
    }

    public Integer getCorrectAnswer() {
        return correctAnswer;
    }

    public void setCorrectAnswer(Integer correctAnswer) {
        this.correctAnswer = correctAnswer;
    }

    @Override
    public String toString() {
        return "Question{" + "id=" + id + ", question=" + question + ", answers=" + answers + ", correctAnswer=" + correctAnswer + '}';
    }
}
