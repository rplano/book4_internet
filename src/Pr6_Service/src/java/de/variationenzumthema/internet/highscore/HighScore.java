package de.variationenzumthema.internet.highscore;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * HighScore
 *
 * A POJO made up of a userId and a score.
 * 
 * - @XmlRootElement is needed when you want to produce XML as output
 * - make sure this is a proper POJO, i.e., it needs getters and setters for all attributes!
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
@Entity
@Table(name = "HighScore")
@XmlRootElement
public class HighScore {

    @Id
    private String userId;
    
    @Column(nullable = false)
    private int score;
    
    /**
     * Hibernate needs a default constructor.
     */
    public HighScore() {
        super();
    }

    public HighScore(String userId, int score) {
        super();
        this.userId = userId;
        this.score = score;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }
    
    @Override
    public String toString() {
        return "HighScore{" + "userId=" + userId + ", score=" + score + '}';
    }
}
