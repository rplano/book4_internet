<%@page import="java.util.List"%>
<%@page import="de.variationenzumthema.internet.mensa.Ingredient"%>
<%@page import="de.variationenzumthema.internet.mensa.IngredientDao"%>
<!DOCTYPE html>
<html>
    <body>
        <%@include file="mensaNavigation.jsp" %>
        <h2>List all Ingredients</h2>
        <ul>
<%
    IngredientDao daoIng = (IngredientDao)application.getAttribute("Mensa.IngredientDao");
    List<Ingredient> ings = daoIng.findAll();
    for (Ingredient ing : ings) {
        out.println("<li>"+ing+"</li>");
    }
%>            
        </ul>     
    </body>
</html>
