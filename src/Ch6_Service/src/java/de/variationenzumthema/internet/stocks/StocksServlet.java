package de.variationenzumthema.internet.stocks;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * StocksServlet
 *
 * Demos how to use servlets to implement a simple restful web service.
 * 
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
public class StocksServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init();
        String path = getServletContext().getRealPath("/") + "SP500_HistoricalStockDataMonthly.csv";
        ServletContext application = getServletContext();

        // init database with data from file:
        StockDao dao = new StockDao();
        List<String> dates = dao.initStockPriceTable(path);
        application.setAttribute("Stocks.dao", dao);
        application.setAttribute("Stocks.dates", dates);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // query database for symbol
        String symbol = request.getParameter("symbol");
        StockDao dao = (StockDao) getServletContext().getAttribute("Stocks.dao");
        List<String> dates = (List<String>) getServletContext().getAttribute("Stocks.dates");
        StockSymbol sp = dao.getStockPrice(symbol);
 
        PrintWriter out = response.getWriter();
        if (sp != null) {
            out.println(sp.getJSON());
        } else {
            //out.println("symbol not found");
            //response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            response.sendError(HttpServletResponse.SC_NOT_FOUND,"stock symbol not found");
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet implementing a webservice to retrieve stock price quotes.";
    }
}
