<!DOCTYPE html>
<html>
    <body>
        <%@include file="navigation.jsp" %>
        <h2>Add New Ingredient</h2>
        <form action="index.jsp" method="GET">
            Name:  <input type="text" name="name"/><br/>
            Size:  <input type="text" name="size"/><br/>
            Calories: <input type="text" name="calories"/><br/>
            <input type="hidden" name="addIngredient"/>
            <input type="submit" value="Add Ingredient"/>
        </form>
    </body>
</html>
