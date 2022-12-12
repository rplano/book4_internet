package de.variationenzumthema.internet;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * HighScore
 *
 * A POJO made up of a userId and a score.
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
@Entity
@Table(name = "HighScore")
public class HighScore {

    @Id
    private String userId;
    
    @Column(nullable = false)
    private double score;
    
    /**
     * Hibernate needs a default constructor.
     */
    public HighScore() {
        super();
    }

    public HighScore(String userId, int score) {
        this.userId = userId;
        this.score = score;
    }

    public String getUserId() {
        return userId;
    }

    public double getScore() {
        return score;
    }
    
    @Override
    public String toString() {
        return "HighScore{" + "userId=" + userId + ", score=" + score + '}';
    }
}
