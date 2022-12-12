package de.variationenzumthema.internet;

import java.util.Random;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * Hangman
 *
 * Contains logic for the hangman.jsp page.
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
public class Hangman {

    private String guessWord;
    private String hintWord;
    private int counter;
    
    private Random rgen = new Random();
    
    public Hangman() {
        guessWord = pickGuessWord();
        hintWord = createHintWord();
        counter = 0;
    }

    public String getGuessWord() {
        return guessWord;
    }

    public String getHintWord() {
        return hintWord;
    }

    public int getCounter() {
        return counter;
    }
    
    public boolean areWeDone() {
        return (!hintWord.contains("-"));
    }
    
    public void checkGuess(String guess) {
        guess = guess.toLowerCase();
        if (guessWord.contains(guess)) {
            buildNewHintWord(guess.charAt(0));
        } else {
            counter++;
        }
    }
    
    public void buildNewHintWord(char c) {
        String temp = "";
        for (int i = 0; i < hintWord.length(); i++) {
            if (guessWord.charAt(i) == c) {
                temp += c;
            } else {
                temp += hintWord.charAt(i);
            }
        }
        hintWord = temp;
    }
    
    private String createHintWord() {
        String hintWord = "";
        for (int i = 0; i < guessWord.length(); i++) {
            hintWord += "-";
        }
        return hintWord;
    }
    
    private String pickGuessWord() {
        String[] words = {"dog", "fish", "chicken", "cat", "mother"};
        int index = rgen.nextInt(words.length);
        return words[index];
    }
}
