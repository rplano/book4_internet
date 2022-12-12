package de.variationenzumthema.internet;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * MensaDishDao
 *
 * Data access object used to interact with database.
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
public class MensaDishDao extends GenericDao<String, Dish> {

    public MensaDishDao() {
        super();
    }

    public void initDatabase(MensaIngredientDao daoIng) {
        Set<Ingredient> ingrds = new HashSet<Ingredient>();
        ingrds.add(daoIng.findById("Egg"));
        ingrds.add(daoIng.findById("Butter"));
        ingrds.add(daoIng.findById("Milk"));
        ingrds.add(daoIng.findById("Flour"));
        save(new Dish("Pancake", 2.50, ingrds));
    }
}
