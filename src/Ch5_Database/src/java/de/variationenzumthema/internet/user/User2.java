package de.variationenzumthema.internet.user;
 
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
 
@Entity
@Table(name = "Users")
public class User2 {
     
    @Id
    private String lastName;

    @OneToMany
    private Set<Email> email;

    public User2() {
        super();
    }

    public User2(String lastName) {
        this.lastName = lastName;
        this.email = new HashSet<Email>();
    }
    
    public void addEmail(Email email) {
        this.email.add(email);
    }
}
