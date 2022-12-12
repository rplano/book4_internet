package de.variationenzumthema.internet.login;

import java.math.BigInteger;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * Login: Utility
 *
 * A bunch of utility functions related to security.
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
public class Utility {

    /**
     * Uses a simple regular expression to test if password is somewhat
     * non-trivial.<br/>
     * IS NOT PERFECT!!!
     *
     * @param passwd
     * @return
     */
    public static boolean isStrongPassword(String passwd) {
        Pattern pat = Pattern.compile("^(?=.*[A-Z].)(?=.*[\\.\\]\\[@#%$|&?+*^_~<>}'\",;:!=-])(?=.*[0-9])(?=.*[a-z]).{6,}$");
        Matcher mat = pat.matcher(passwd);
        boolean b = mat.find();
        return b;
    }

    public static boolean isValidEmail(String emailId) {
        String regExpEmail
                = "([a-zA-Z0-9_\\-\\.]+)" + // user
                "@"
                + "([a-zA-Z0-9_\\-\\.]{2,})" + // domain / subdomain
                "\\."
                + "([a-zA-Z]{2,5})";			// country
        Pattern pat = Pattern.compile(regExpEmail);
        Matcher mat = pat.matcher(emailId);
        boolean b = mat.find();
        return b;
    }

    /**
     * https://tersesystems.com/2015/12/17/the-right-way-to-use-securerandom/
     */
    public static String createVerificationToken() {
        SecureRandom sr = new SecureRandom();   // this may take a little while
        byte[] values = new byte[32];
        sr.nextBytes(values);
        return byteArrayToHexString(values);
    }

    /**
     * Creates a reasonably strong new passwd.
     *
     * @return
     */
    public static String createStrongPassword() {
        String passwd = "";
        passwd += getRandomChar(65, 90);	// caps
        passwd += getRandomChar(97, 122);	// small
        passwd += getRandomChar(48, 57);	// digit
        passwd += getRandomChar(33, 46);	// special
        passwd += getRandomChar(65, 90);	// caps
        passwd += getRandomChar(97, 122);	// small
        passwd += getRandomChar(48, 57);	// digit
        passwd += getRandomChar(48, 57);	// digit
        return passwd;
    }

    /**
     * Returns a random char between ASCII code beg and end (inclusive);
     *
     * @param beg
     * @param end
     * @return
     */
    private static char getRandomChar(int beg, int end) {
        Random random = new Random();
        int r = random.nextInt(end - beg + 1);
        return (char) (beg + r);
    }

    /**
     * http://howtodoinjava.com/security/how-to-generate-secure-password-hash-md5-sha-pbkdf2-bcrypt-examples/
     * http://www.jasypt.org/howtoencryptuserpasswords.html
     */
    public static void main(String[] args) throws NoSuchAlgorithmException, InvalidKeySpecException {
        String originalPassword = "password";
        int iterations = 881;
        int keyLength = 256;
        byte[] fixedSalt = getSalt();
        //System.out.println(toHex(fixedSalt));
        //System.out.println(byteArrayToHexString(fixedSalt));
        String hash = generatePasswordHash(originalPassword, fixedSalt, iterations, keyLength);
        System.out.println(hash);
    }

    /**
     *
     * @param password
     * @return
     * @throws NoSuchAlgorithmException
     * @throws InvalidKeySpecException
     */
    public static String generatePasswordHash(String password, byte[] fixedSalt, int iterations, int keyLength) {
        try {
            char[] chars = password.toCharArray();
            //byte[] salt = getSalt();
            PBEKeySpec spec = new PBEKeySpec(chars, fixedSalt, iterations, keyLength);
            SecretKeyFactory skf = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
            byte[] hash = skf.generateSecret(spec).getEncoded();
            //return iterations + ":" + toHex(salt) + ":" + toHex(hash);
            return toHex(hash);
        } catch (Exception e) {
            System.err.println(e);
        }
        return null;
    }

    private static byte[] getSalt() throws NoSuchAlgorithmException {
        SecureRandom sr = SecureRandom.getInstance("SHA1PRNG");
        byte[] salt = new byte[16];
        sr.nextBytes(salt);
        return salt;
    }

    private static String toHex(byte[] array) throws NoSuchAlgorithmException {
        BigInteger bi = new BigInteger(1, array);
        String hex = bi.toString(16);
        int paddingLength = (array.length * 2) - hex.length();
        if (paddingLength > 0) {
            return String.format("%0" + paddingLength + "d", 0) + hex;
        } else {
            return hex;
        }
    }

    private final static char[] HEX_VALUES = {'0', '1', '2', '3', '4', '5',
        '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};

    public static String byteArrayToHexString(byte[] buffer) {
        char[] hex = new char[buffer.length * 2];
        int tmp;
        for (int j = 0; j < buffer.length; j++) {
            tmp = buffer[j] & 0xFF;
            hex[j * 2] = HEX_VALUES[tmp >>> 4];
            hex[j * 2 + 1] = HEX_VALUES[tmp & 0x0F];
        }
        return new String(hex);
    }

    public static byte[] hexStringToByteArray(String hexString) {
        int len = hexString.length();
        byte[] buffer = new byte[len / 2];
        for (int i = 0; i < len; i += 2) {
            buffer[i / 2] = (byte) ((Character.digit(hexString.charAt(i), 16) << 4) + Character
                    .digit(hexString.charAt(i + 1), 16));
        }
        return buffer;
    }
}
