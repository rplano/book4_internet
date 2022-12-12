package de.variationenzumthema.internet;

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
public class MensaIngredientDao extends GenericDao<String, Ingredient> {

    public MensaIngredientDao() {
        super();
    }
    
    public void initDatabase() {
        save( new Ingredient("Egg", "large", 80) );
        save( new Ingredient("Butter", "1 table spoon", 100) );
        save( new Ingredient("Milk", "1 cup", 150) );
        save( new Ingredient("Flour", "100 g", 364) );
    }
}