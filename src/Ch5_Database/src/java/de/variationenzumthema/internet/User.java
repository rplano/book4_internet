package de.variationenzumthema.internet;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Users")
public class User {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(nullable = false)
    private String lastName;
    
    private String firstName;
    
    private String email;
    
    private int age;

    // Hibernate needs a default constructor.
    public User() {
        super();
    }

    public User(String lastName, String firstName, String email) {
        this.lastName = lastName;
        this.firstName = firstName;
        this.email = email;  
    }
  
    @Override
    public String toString() {
        return "User{" + "id=" + id + ", lastName=" + lastName + ", firstName=" + firstName + ", email=" + email + '}';
    }
}
