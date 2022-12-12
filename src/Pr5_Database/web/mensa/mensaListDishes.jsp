<%@page import="java.util.List"%>
<%@page import="de.variationenzumthema.internet.mensa.Dish"%>
<%@page import="de.variationenzumthema.internet.mensa.DishDao"%>
<!DOCTYPE html>
<html>
    <body>
        <%@include file="mensaNavigation.jsp" %>
        <h2>List all Dishes</h2>
        <ul>
<%
    DishDao daoDish = (DishDao)application.getAttribute("Mensa.DishDao");
    List<Dish> dishs = daoDish.findAll();
    for (Dish di : dishs) {
        out.println("<li>"+di+"</li>");
    }
%>            
        </ul>      
    </body>
</html>
