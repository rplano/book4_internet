package de.variationenzumthema.internet.user;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Email")
public class Email {

    @Id
    private String emailAddress;   
    
    public Email() {
        super();
    }
    
    public Email(String emailAddress) {
        this.emailAddress = emailAddress;
    }
}
