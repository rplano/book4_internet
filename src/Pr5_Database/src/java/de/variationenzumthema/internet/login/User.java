package de.variationenzumthema.internet.login;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

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
@Entity
@Table(name = "Users")
public class User {

    @Id
    private String emailId;
    
    @Column(nullable = false)
    private String alias;
    
    @Column(length = 256, nullable = false)
    private String hashOfPasswd;
    
    @Column(nullable = false)
    private String favoriteColor;
    
    @Column(nullable = true)
    private String verificationToken = "New user, not verified.";

    /**
     * Hibernate needs a default constructor.
     */
    public User() {
        super();
    }

    public User(String emailId, String alias, String hashOfPasswd, String favoriteColor, String verificationToken) {
        this.emailId = emailId;
        this.alias = alias;
        this.hashOfPasswd = hashOfPasswd;
        this.favoriteColor = favoriteColor;
        this.verificationToken = verificationToken;
    }

    public String getEmailId() {
        return emailId;
    }

    public String getAlias() {
        return alias;
    }

    public String getHashOfPasswd() {
        return hashOfPasswd;
    }

    public void setHashOfPasswd(String hashOfPasswd) {
        this.hashOfPasswd = hashOfPasswd;
    }

    public String getFavoriteColor() {
        return favoriteColor;
    }

    public String getVerificationToken() {
        return verificationToken;
    }

    public void setVerificationToken(String verificationToken) {
        this.verificationToken = verificationToken;
    }

    public boolean isVerifiedUser() {
        if (verificationToken == null) {
            return true;
        }
        return false;
    }

    @Override
    public String toString() {
        return "User{" + "emailId=" + emailId + ", alias=" + alias + ", hashOfPasswd=, favoriteColor=" + favoriteColor + ", verificationToken=" + verificationToken + '}';
    }
}
