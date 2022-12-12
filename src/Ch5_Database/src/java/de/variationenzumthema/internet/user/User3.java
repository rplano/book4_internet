package de.variationenzumthema.internet.user;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Users")
public class User3 { 
     
    @Id
    private String lastName;

    @ManyToOne
    private Email email;

    public User3() {
        super();
    }

    public User3(String lastName) {
        this.lastName = lastName;
    }
    
    public void addEmail(Email email) {
        this.email = email;
    }
    
}
