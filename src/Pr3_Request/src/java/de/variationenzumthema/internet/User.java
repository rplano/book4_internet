package de.variationenzumthema.internet;

import java.awt.Color;
import java.util.Date;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * Login: User
 *
 * A dish has a name, a price and a list of ingredients.
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
public class User {
    private String emailId;
    private String password;
    private Color favoriteColor;
    private Boolean vegetarian;
    private Integer age;
    private Double size;
    private Date bday;

    public User() {
    }

    public User(String emailId, Color favoriteColor, Boolean vegetarian, Integer age, Double size, Date bday) {
        this.emailId = emailId;
        this.favoriteColor = favoriteColor;
        this.vegetarian = vegetarian;
        this.age = age;
        this.size = size;
        this.bday = bday;
    }

    @Override
    public String toString() {
        return "User{" + "emailId=" + emailId + ", password=" + password + ", favoriteColor=" + favoriteColor + ", vegetarian=" + vegetarian + ", age=" + age + ", size=" + size + ", bday=" + bday + '}';
    }
    
}
