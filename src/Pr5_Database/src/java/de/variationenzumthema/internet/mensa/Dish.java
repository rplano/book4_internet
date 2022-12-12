package de.variationenzumthema.internet.mensa;

import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * Mensa: Dish
 *
 * A dish has a name, a price and a list of ingredients.
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
@Entity
@Table(name = "Dish")
public class Dish {

    @Id
    private String name;
    
    @Column(nullable = false)
    private double price;
    
    @ManyToMany
    private Set<Ingredient> ingredients;
    
    /**
     * Hibernate needs a default constructor.
     */
    public Dish() {
        super();
    }

    public Dish(String name, double price, Set<Ingredient> ingredients) {
        this.name = name;
        this.price = price;
        this.ingredients = ingredients;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public Set<Ingredient> getIngredients() {
        return ingredients;
    }

    @Override
    public String toString() {
        String ret = name + ": $" + String.format("%10.2f", price) + " (";
        for (Ingredient ing : ingredients ) {
            ret += ing.getName() + ",";
        }
        ret = ret.substring(0,ret.length()-1);
        ret += ")";
        return ret;
    }
}
