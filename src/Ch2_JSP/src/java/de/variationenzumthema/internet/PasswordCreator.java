package de.variationenzumthema.internet;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 * 
 * Ch2_JSP: passwordCreator.jsp
 * 
 * A simple password creator.
 * 
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
public class PasswordCreator {
    private static final String small = "abcdefghijklmnopqrstuvwxyz";
    private static final String big = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    private static final String numbers = "0123456789";
    private static final String symbols = "!#$%&'()*+,-./:;<=>?@[]^_{|}";

    public static String generatePassword() {
        String password = "";
        password += small.charAt(nextInt(small.length()));
        password += big.charAt(nextInt(big.length()));
        password += numbers.charAt(nextInt(numbers.length()));
        password += symbols.charAt(nextInt(symbols.length()));
        password += small.charAt(nextInt(small.length()));
        password += big.charAt(nextInt(big.length()));
        password += numbers.charAt(nextInt(numbers.length()));
        password += symbols.charAt(nextInt(symbols.length()));
        return password;
    }
    
    private static int nextInt(int max) {
        return (int)(Math.random()*max);
    }
}
