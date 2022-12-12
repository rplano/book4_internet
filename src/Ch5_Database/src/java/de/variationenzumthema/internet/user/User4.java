package de.variationenzumthema.internet.user;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Users")
public class User4 {
     
    @Id
    private String lastName;

    @ManyToMany
    private Set<Email> email;

    public User4() {
        super();
    }

    public User4(String lastName) {
        this.lastName = lastName;
        this.email = new HashSet<Email>();
    }
    
    public void addEmail(Email email) {
        this.email.add(email);
    }
    
}
