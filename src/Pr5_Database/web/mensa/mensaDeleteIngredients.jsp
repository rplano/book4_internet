<%@page import="java.util.List"%>
<%@page import="de.variationenzumthema.internet.mensa.Ingredient"%>
<%@page import="de.variationenzumthema.internet.mensa.IngredientDao"%>
<!DOCTYPE html>
<html>
    <body>
        <%@include file="mensaNavigation.jsp" %>
        <h2>Delete Ingredient</h2>
        <p>IMPORTANT: You can only delete ingredients that are not used in any dish!</p>
        <form action="mensaLogic.jsp" method="GET">
<%
    IngredientDao daoIng = (IngredientDao)application.getAttribute("Mensa.IngredientDao");
    List<Ingredient> ings = daoIng.findAll();
    for (Ingredient ing : ings) {
        out.println("<input type='checkbox' name='ingredient' value='"+ing.getName()+"'/>"+ing.getName()+"  ");
    }
%>             
            <input type="hidden" name="deleteIngredient"/>
            <input type="submit" value="Delete Ingredients"/>
        </form>
    </body>
</html>
