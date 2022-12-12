<%@page import="java.util.List"%>
<%@page import="de.variationenzumthema.internet.stocks.StockSymbol"%>
<%@page import="de.variationenzumthema.internet.stocks.StockDao"%>
<%!    
    public void jspInit() {
        String path = getServletContext().getRealPath("/") + "stocks/SP500_HistoricalStockDataMonthly.csv";
        ServletContext application = getServletConfig().getServletContext();

        // init database with data from file:
        StockDao dao = new StockDao();
        List<String> dates = dao.initStockPriceTable(path);
        application.setAttribute("Stocks.dao", dao);
        application.setAttribute("Stocks.dates", dates);
    }
%>
<%
    // query database for symbol
    String symbol = request.getParameter("symbol");
    StockDao dao = (StockDao) application.getAttribute("Stocks.dao");
    List<String> dates = (List<String>) application.getAttribute("Stocks.dates");
    StockSymbol sp = dao.getStockPrice(symbol);

    // show stock prices:
%>
<!DOCTYPE html>
<html>
    <body>
        <h1>Stocks</h1>
        <p>Prices for <strong><%= sp.getSymbol()%></strong>:</p>
        <table border="1">
            <tr>
<%
    for (int i = 0; i < dates.size(); i++) {
        out.println("<td>"+dates.get(i)+"</td>");
    }
%>            
            </tr>
            <tr>
<%
    List<Double> prices = sp.getPrices();
    for (int i = 0; i < prices.size(); i++) {
        out.println("<td>"+prices.get(i)+"</td>");
    }
%>            
            </tr>
        </table>
        <p><a href="stocksGraphics.jsp?symbol=<%= symbol %>">Graph</a></p>
    </body>
</html>