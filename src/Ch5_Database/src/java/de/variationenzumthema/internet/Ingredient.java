package de.variationenzumthema.internet;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * Mensa: Ingredient
 *
 * An ingredient has a name, a price and calories.
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
@Entity
@Table(name = "Ingredient")
public class Ingredient {
    
    @Id
    private String name;
    
    @Column(nullable = true)
    private String size;
    
    @Column(nullable = true)
    private double calories;
    
    /**
     * Hibernate needs a default constructor.
     */
    public Ingredient() {
        super();
    }

    public Ingredient(String name, String size, double calories) {
        this.name = name;
        this.size = size;
        this.calories = calories;
    }

    public String getName() {
        return name;
    }

    public String getSize() {
        return size;
    }

    public double getCalories() {
        return calories;
    }

    @Override
    public String toString() {
        return "Ingredient{" + "name=" + name + ", size=" + size + ", calories=" + calories + '}';
    }
}
