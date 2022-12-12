package de.variationenzumthema.internet.chirpr;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * Chirpr: Tag
 *
 * A tag has an id and a bunch of chirps.
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
@Entity
@Table(name = "Tag")
public class Tag {

    @Id
    private String tagId;
    
    @OneToMany
    private Set<Chirp> chirps;
    
    /**
     * Hibernate needs a default constructor.
     */
    public Tag() {
        super();
    }

    public Tag(String tagId) {
        this.tagId = tagId;
        this.chirps = new HashSet<Chirp>();
    }

    public String getTagId() {
        return tagId;
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
        return "Tag{" + "tagId=" + tagId + ", chirps=" + chirps + '}';
    }
    
}
