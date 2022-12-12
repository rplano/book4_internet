package de.variationenzumthema.internet.user;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Users")
public class User1 {
     
    @Id
    private String lastName;

    @OneToOne
    @JoinColumn(unique=true)
    private Email email;

    public User1() {
        super();
    }
    
    public User1(String lastName) {
        this.lastName = lastName;
    }
    
    public void addEmail(Email email) {
        this.email = email;
    }
    
}
