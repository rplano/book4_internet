package de.variationenzumthema.internet.stocks;

import de.variationenzumthema.internet.HibernateUtil;
import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * StockDao
 *
 * Data access object used to interact with database.
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
public class StockDao {

    private Session hibSession = null;

    public StockDao() {
        this.hibSession = HibernateUtil.getSessionFactory().openSession();
    }

    public StockSymbol getStockPrice(String symbol) {
        return (StockSymbol) hibSession.get(StockSymbol.class, symbol);
    }
    
    public List<String> initStockPriceTable(String path) {
        long start = System.currentTimeMillis();
        List<String> dates = null;
        try {
            hibSession.beginTransaction();
            BufferedReader br = new BufferedReader(new FileReader(path));

            // first line contains dates:
            String line = br.readLine();
            dates = readDates(line);

            // other lines contain data:
            while (true) {
                line = br.readLine();
                if (line == null) {
                    break;
                }
                StockSymbol entry = new StockSymbol(line);
                hibSession.save(entry);
            }
 
            br.close();
            hibSession.getTransaction().commit();

        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("Time to load: "+(System.currentTimeMillis()-start)+" ms");        
        return dates;
    }

    private List<String> readDates(String line) {
        List<String> dates = new ArrayList<String>();
        String[] datesArray = line.split(",");
        for (int i = 1; i < datesArray.length; i++) {
            dates.add(datesArray[i]);
        }
        return dates;
    }
}
