package de.variationenzumthema.internet.chirpr;

import de.variationenzumthema.internet.GenericDao;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * TagDao
 *
 * Data access object used to interact with database.
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
public class TagDao extends GenericDao<String, Tag> {

    public TagDao() {
        super();
    }
    
    /**
     * http://stackoverflow.com/questions/15578314/parsing-hashtags-in-twitter-api-php
     * 
     * Where might a hashtag appear?
     * - at the beginning
     * - after whitespace
     * @param text 
     */
    public void parseChirpForTags(Chirp crp) {
        Pattern pat = Pattern.compile("(^|\\s)\\#(\\w+)");
        Matcher mat = pat.matcher(crp.getText());
        while (mat.find()) {
            String tag = mat.group(2);
            //System.out.println("."+tag+".");
            addChirpToTag(tag.toLowerCase(),crp);
        }
    }

    private void addChirpToTag(String tag, Chirp crp) {
        Tag tg = findById(tag);
        if ( tg == null ) {
            tg = new Tag(tag);
            save(tg);
        }
        tg.addChirp(crp);
        merge(tg);
    }
}
