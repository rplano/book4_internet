<%@page import="java.util.List"%>
<%@page import="de.variationenzumthema.internet.mensa.Ingredient"%>
<%@page import="de.variationenzumthema.internet.mensa.IngredientDao"%>
<!DOCTYPE html>
<html>
    <body>
        <%@include file="mensaNavigation.jsp" %>
        <h2>Add New Ingredient</h2>
        <form action="mensaLogic.jsp" method="GET">
            Name:  <input type="text" name="name"/><br/>
            Size:  <input type="text" name="size"/><br/>
            Calories: <input type="text" name="calories"/><br/>
            <input type="hidden" name="addIngredient"/>
            <input type="submit" value="Add Ingredient"/>
        </form>
    </body>
</html>
