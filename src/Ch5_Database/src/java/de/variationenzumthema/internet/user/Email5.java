package de.variationenzumthema.internet.user;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Email")
public class Email5 {

    @Id
    private String emailAddress;   
    
    @OneToMany
    private Set<User5> users;
    
    public Email5() {
        super();
    }
    
    public Email5(String emailAddress) {
        this.emailAddress = emailAddress;
        this.users = new HashSet<User5>();
    }
    
    public void addUser(User5 user) {
        this.users.add(user);
    }
}
