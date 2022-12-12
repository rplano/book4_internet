package de.variationenzumthema.internet.mensa;

import de.variationenzumthema.internet.GenericDao;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * MensaIngredientDao
 *
 * Data access object used to interact with database.
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
public class IngredientDao extends GenericDao<String, Ingredient> {

    public IngredientDao() {
        super();
    }
    
    public void initDatabase() {
        merge( new Ingredient("Egg", "large", 80) );
        merge( new Ingredient("Butter", "1 table spoon", 100) );
        merge( new Ingredient("Milk", "1 cup", 150) );
        merge( new Ingredient("Flour", "100 g", 364) );
    }
}