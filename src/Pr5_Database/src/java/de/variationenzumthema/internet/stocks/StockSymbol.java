package de.variationenzumthema.internet.stocks;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * Stocks: StockEntry
 *
 * A stock entry, representing the data of one stock symbol.<br/>
 * a,45.51,42.82,45.1936,42.0624,41.6136,42.7478,...,null,
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
@Entity
@Table(name = "StockSymbol")
public class StockSymbol {

    @Id
    private String symbol;
  
    @ElementCollection
    @Column(name = "prices", nullable = false)
    private List<Double> prices;

    /**
     * Hibernate needs a default constructor.
     */
    public StockSymbol() {
        super();
    }

    public StockSymbol(String line) {
        String[] sVals = line.split(",");
        symbol = sVals[0];
        prices = new ArrayList<Double>();
        for (int i = 1; i < sVals.length; i++) {
            if (sVals[i].equals("null")) {
                prices.add(-1.0);
            } else {
                prices.add(Double.parseDouble(sVals[i]));
            }
        }
    }

    public String getSymbol() {
        return symbol;
    }

    public List<Double> getPrices() {
        return prices;
    }

    @Override
    public String toString() {
        return "StockPrice{" + "symbol=" + symbol + ", prices=" + prices + '}';
    }

}
