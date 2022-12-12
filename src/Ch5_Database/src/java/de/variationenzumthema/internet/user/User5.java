package de.variationenzumthema.internet.user;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Users")
public class User5 {
     
    @Id
    private String lastName;

    @ManyToOne
    private Email5 email;

    public User5() {
        super();
    }

    public User5(String lastName) {
        this.lastName = lastName;
    }
    
    public void addEmail(Email5 email) {
        this.email = email;
    }
    
}
