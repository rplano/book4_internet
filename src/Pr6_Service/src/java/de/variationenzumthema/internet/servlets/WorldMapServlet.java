package de.variationenzumthema.internet.servlets;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * WorldMapResource
 *
 * A restful resource.
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
public class WorldMapServlet extends HttpServlet {

    private final int WIDTH = 350;
    private final int HEIGHT = 200;
    private String json = "";

    @Override
    public void init() throws ServletException {
        super.init();
        String path = getServletContext().getRealPath("/") + "Cities.txt";
        json = loadAndDisplayData(path);
    }

    private String loadAndDisplayData(String fileName) {
        String json = "{\"data\": [";
        //json += "[ [5, 20], [480, 90], [250, 50], [100, 33], [220, 88]]";
        try {
            BufferedReader br = new BufferedReader(new FileReader(fileName));
            while (true) {
                String line = br.readLine();
                if (line == null) {
                    break;
                }

                if (!line.startsWith("#")) {
                    // Germany, Berlin, 52", 32', N, 13", 25', E
                    String[] data = line.split(",");
                    String country = data[0].trim();
                    String name = data[1].trim();
                    String lat1 = data[2].trim();
                    String lat2 = data[3].trim();
                    String lat3 = data[4].trim();

                    int lat = Integer.parseInt(lat1);
                    if (lat3.endsWith("S")) {
                        lat = -lat;
                    }
                    String lon1 = data[5].trim();
                    String lon2 = data[6].trim();
                    String lon3 = data[7].trim();
                    int lon = Integer.parseInt(lon1);
                    if (lon3.endsWith("E")) {
                        lon = -lon;
                    }

                    int x = (int)((0.5 - lon / 360.0) * WIDTH);
                    int y = (int)((0.5 - lat / 180.0) * HEIGHT);
                    json += "["+x+", "+y+"],";                   
//                    GOval city = new GOval(CITY_SIZE, CITY_SIZE);
//                    if (country.equals("Germany")) {
//                        city.setFilled(true);
//                        city.setColor(Color.RED);
//                    }
//                    add(city, x, y);
                    // //println(name+":"+x+","+y);
                }
            }
            br.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        json = json.substring(0,json.length()-1);
        json += "]}";
        return json;
    }

    /**
     * Simply return the JSON object: {"data": [[235, 62],[242, 62],...]}
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        out.println(json);
    }
}
