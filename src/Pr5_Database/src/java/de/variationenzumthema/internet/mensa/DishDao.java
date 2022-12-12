package de.variationenzumthema.internet.mensa;

import de.variationenzumthema.internet.GenericDao;
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
public class DishDao extends GenericDao<String, Dish> {

    public DishDao() {
        super();
    }

    public void initDatabase(IngredientDao daoIng) {
        Set<Ingredient> ingrdsPanCake = new HashSet<Ingredient>();
        ingrdsPanCake.add(daoIng.findById("Egg"));
        //ingrds.add(daoIng.findById("Butter"));
        ingrdsPanCake.add(daoIng.findById("Milk"));
        ingrdsPanCake.add(daoIng.findById("Flour"));
        merge(new Dish("Pancake", 2.50, ingrdsPanCake));

        Set<Ingredient> ingrdsScrambledEggs = new HashSet<Ingredient>();
        ingrdsScrambledEggs.add(daoIng.findById("Egg"));
        merge(new Dish("Scrambled Eggs", 1.50, ingrdsScrambledEggs));
    }
}
