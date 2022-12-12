<!DOCTYPE html>
<html>
    <body>
        <%@include file="navigation.jsp" %>
        <h2>Delete Ingredient</h2>
        <p>IMPORTANT: You can only delete ingredients that are not used in any dish!</p>
        <form action="index.jsp" method="GET">
<input type='checkbox' name='ingredient' value='Egg'/>Egg   
<input type='checkbox' name='ingredient' value='Butter'/>Butter   
<input type='checkbox' name='ingredient' value='Milk'/>Milk   
<input type='checkbox' name='ingredient' value='Flour '/>Flour    
            <input type="hidden" name="deleteIngredient"/>
            <input type="submit" value="Delete Ingredients"/>
        </form>
    </body>
</html>
