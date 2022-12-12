package de.variationenzumthema.internet.chirpr;

import java.util.regex.Pattern;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.GenerationType;
import javax.persistence.GeneratedValue;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * Chirpr: Chirp
 *
 * A chirp has a user and a text.
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
@Entity
@Table(name = "Chirp")
public class Chirp {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(length = 42, nullable = false)
    private String text;
    
    /**
     * Hibernate needs a default constructor.
     */
    public Chirp() {
        super();
    }

    public Chirp(String text) {
        this.text = text;
    }

    public Long getId() {
        return id;
    }

    public String getText() {
        return text;
    }

    public String getTextWithLinks() {
        String html = text.replaceAll("(^|\\s)\\#(\\w+)", "<a href='tag.jsp?id=$2'>#$2</a>");
        return html;
    }

    @Override
    public String toString() {
        return "Chirp{" + "id=" + id + ", text=" + text + '}';
    }
}
