package de.variationenzumthema.internet.login;

import de.variationenzumthema.internet.GenericDao;
import javax.servlet.http.HttpServletRequest;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * UserDao
 *
 * Data access object used to interact with database.
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
public class UserDao extends GenericDao<String, User> {

    private byte[] salt;
    private int iterations;
    private int passwordHashedLength;

    public UserDao() {
        super();
        // TODO: the following should be loaded from config file:
        salt = Utility.hexStringToByteArray("3577b8a868cce281cc76cf859613d5ad");
        iterations = 881;
        passwordHashedLength = 256;    // when changed need to adjust User.hashOfPasswd length
    }

    /**
     * TODO: should log failed login attempts with reason
     */
    public User loginUser(String emailId, String passwd) {
        User usr = findById(emailId);
        if (usr != null) {
            if (usr.isVerifiedUser()) {
                String pwdHash = Utility.generatePasswordHash(passwd, salt, iterations, passwordHashedLength);        //User(String emailId, String alias, String hashOfPasswd, String favoriteColor) {        
                if (pwdHash.equals(usr.getHashOfPasswd())) {
                    return usr;
                }
            }
        }
        return null;
    }

    public String forgotPassword(String emailId, String favoriteColor) {
        User usr = findById(emailId);
        if (usr != null) {
            
            if (favoriteColor.equalsIgnoreCase(usr.getFavoriteColor())) {
                String verificationToken = Utility.createVerificationToken();
                usr.setVerificationToken(verificationToken);    // make sure usr cannot login
                String passwd = Utility.createStrongPassword();
                String hashOfPasswd = Utility.generatePasswordHash(passwd, salt, iterations, passwordHashedLength);        //User(String emailId, String alias, String hashOfPasswd, String favoriteColor) {        
                usr.setHashOfPasswd(hashOfPasswd);
                merge(usr);

                String email = "Your new password is: " + passwd +"<br/>";
                email += "Click on this link to verify your email identity: ";
                email += "<a href='verifyEmail.jsp?emailId="+emailId+"&verificationToken="+verificationToken+"'>link</a>";                
                return email;
            }
        }
        return null;
    }

    public String changePassword(HttpServletRequest request, User usr) {
        String error = "An unknown error occured.";
        String password = request.getParameter("password");
        String newPassword1 = request.getParameter("newPassword1");
        String newPassword2 = request.getParameter("newPassword2");
        if ((password != null) && (newPassword1 != null) && (newPassword2 != null)) {
            if ( newPassword1.equals(newPassword2)) {
                if (usr != null) {
                    String hashOfPasswd = Utility.generatePasswordHash(password, salt, iterations, passwordHashedLength);
                    if (hashOfPasswd.equals(usr.getHashOfPasswd())) {
                        if (Utility.isStrongPassword(newPassword1)) {
                            String hashOfNewPasswd1 = Utility.generatePasswordHash(newPassword1, salt, iterations, passwordHashedLength);
                            usr.setHashOfPasswd(hashOfNewPasswd1);
                            merge(usr);
                            // everything is fine!
                            error = null;
                            
                        } else {
                            error = "Your password must be at least 6 chars long and contain a small letter, a capital letter, a digit and a special character.";
                        }
                    } else {
                        error = "You entered the wrong password.";
                    }
                } else {
                    error = "You must login before changing your password.";
                }
            } else {
                error = "Your new passwords do not match.";
            }
        } else {
            error = "You must enter all fields.";
        }
        return error;
    }
    
    public String createUser(HttpServletRequest request) {
        String emailId = request.getParameter("emailId");
        String alias = request.getParameter("alias");
        String passwd = request.getParameter("password");
        String favoriteColor = request.getParameter("favoriteColor");  
        String verificationToken = Utility.createVerificationToken();
        String hashOfPasswd = Utility.generatePasswordHash(passwd, salt, iterations, passwordHashedLength);        //User(String emailId, String alias, String hashOfPasswd, String favoriteColor) {        
            
        User usr = new User( emailId,  alias,  hashOfPasswd,  favoriteColor,  verificationToken);
        save(usr);
        
        String email = "Click on this link to verify your email identity: ";
        email += "<a href='verifyEmail.jsp?emailId="+emailId+"&verificationToken="+verificationToken+"'>link</a>";
        
        return email;
    }
    
    public boolean verifyUser(String emailId,String verificationToken) {
        if ((emailId!=null)&&(verificationToken!=null)) {
            User usr = findById(emailId);
            if (usr != null) {
                if (verificationToken.equalsIgnoreCase(usr.getVerificationToken())) {
                    usr.setVerificationToken(null);
                    merge(usr);
                    return true;
                }
            }
        }
        return false;
    }
    
    /**
     * @return null if user verifies.
     */
    public String verifyRegistrationData(HttpServletRequest request) {
        String error = "An unknown error occured.";
        
        String emailId = request.getParameter("emailId");
        String alias = request.getParameter("alias");
        String passwd = request.getParameter("password");
        String favoriteColor = request.getParameter("favoriteColor");        
        String sum = request.getParameter("sum");
        String result = request.getParameter("result");
        String acceptTerms = request.getParameter("acceptTerms");
        
        // check if robot
        if ((sum != null) && (result != null) && (sum.equals(result))) {
            
            // check if terms accepted.
            if ((acceptTerms != null) && (acceptTerms.equals("on"))) {

                // check if user entered proper data
                if ((emailId!=null)&&(passwd!=null)&&(alias!=null)&&(favoriteColor!=null)) {

                    if (Utility.isValidEmail(emailId)) {
                        if (Utility.isStrongPassword(passwd)) {
                            if ((alias.length()>2)&&(favoriteColor.length()>2)) {
                                
                                // now check if a user with this emailId already exists:
                                if (findById(emailId) == null) {
                                    // everything is fine!
                                    error = null;   
                                    
                                } else {
                                    error = "A user with this email address already exists.";
                                }
                            } else {
                                error = "Your alias and/or favorite color must be at least 3 chars long.";
                            }
                        } else {
                            error = "Your password must be at least 6 chars long and contain a small letter, a capital letter, a digit and a special character.";
                        }
                    } else {
                        error = "Email is not a valid email address.";
                    } 
                } else {
                    error = "All fields are required.";
                }                    
            } else {
                error = "You must accept the terms.";
            }            
        } else {
            error = "Wrong captcha.";
        }        
        return error;
    }

    public void initDatabase() {
        String pwdHash = Utility.generatePasswordHash("123456", salt, iterations, passwordHashedLength);        //User(String emailId, String alias, String hashOfPasswd, String favoriteColor) {        
        merge(new User("ralph@lano.de", "ralphlano", pwdHash, "red", null));
    }

}
