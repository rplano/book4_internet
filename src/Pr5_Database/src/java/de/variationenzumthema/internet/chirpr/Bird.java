package de.variationenzumthema.internet.chirpr;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * Chirpr: User
 *
 * A chirp has a user and a text.
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
@Entity
@Table(name = "Bird")
public class Bird {

    @Id
    private String emailId;
    
    @OneToMany
    private Set<Chirp> chirps;
    
    /**
     * Hibernate needs a default constructor.
     */
    public Bird() {
        super();
    }

    public Bird(String emailId) {
        this.emailId = emailId;
        this.chirps = new HashSet<Chirp>();
    }

    public String getEmailId() {
        return emailId;
    }

    public Set<Chirp> getChirps() {
        return chirps;
    }

    public void setChirps(Set<Chirp> chirps) {
        this.chirps = chirps;
    }
    
    public void addChirp(Chirp chirp) {
        this.chirps.add(chirp);
    }

    @Override
    public String toString() {
        return "Bird{" + "emailId=" + emailId + ", chirps=" + chirps + '}';
    }

}
