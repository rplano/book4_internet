<%@page import="java.text.DateFormat"%><%@page import="java.util.Date"%><%@page import="java.text.SimpleDateFormat"%><%@page import="java.util.List"%><%@page import="de.variationenzumthema.internet.stocks.StockSymbol"%><%@page import="de.variationenzumthema.internet.stocks.StockDao"%><%
    // query database for symbol
    String symbol = request.getParameter("symbol");
    StockDao dao = (StockDao) application.getAttribute("Stocks.dao");
    List<String> dates = (List<String>) application.getAttribute("Stocks.dates");
    StockSymbol sp = dao.getStockPrice(symbol);

    // from 20121011 to 11-Oct-12
    DateFormat formater1 = new SimpleDateFormat("yyyyMMdd");
    DateFormat formater2 = new SimpleDateFormat("dd-MMM-yy");

    // show stock prices in TSV form:  
    out.println("date	close");
    List<Double> prices = sp.getPrices();
    for (int i = 0; i < dates.size(); i++) {
        Date dte = (Date)formater1.parse(dates.get(i));
        out.println(formater2.format(dte) +"	"+prices.get(i));
    }
%>