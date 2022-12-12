<%@page import="java.util.List"%>
<%@page import="de.variationenzumthema.internet.mensa.Ingredient"%>
<%@page import="de.variationenzumthema.internet.mensa.IngredientDao"%>
<!DOCTYPE html>
<html>
    <body>
        <%@include file="mensaNavigation.jsp" %>
        <h2>Add New Dish</h2>
        <form action="mensaLogic.jsp" method="GET">
            Name:  <input type="text" name="name"/><br/>
            Price:  <input type="text" name="price"/><br/>
            Ingredients to add to this dish:<br/>
<%
    IngredientDao daoIng = (IngredientDao)application.getAttribute("Mensa.IngredientDao");
    List<Ingredient> ings = daoIng.findAll();
    for (Ingredient ing : ings) {
        out.println("<input type='checkbox' name='ingredient' value='"+ing.getName()+"'/>"+ing.getName()+"  ");
    }
%> 
            <input type="hidden" name="addDish"/>
            <input type="submit" value="Add Dish"/>
        </form>
    </body>
</html>
