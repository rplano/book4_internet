<!DOCTYPE html>
<html>
    <body>
        <%@include file="navigation.jsp" %>
        <h2>Add New Dish</h2>
        <form action="index.jsp" method="GET">
            Name:  <input type="text" name="name"/><br/>
            Price:  <input type="text" name="price"/><br/>
            Ingredients to add to this dish:<br/>
    <input type='checkbox' name='ingredient' value='Egg'/>Egg  
    <input type='checkbox' name='ingredient' value='Butter'/>Butter  
    <input type='checkbox' name='ingredient' value='Milk'/>Milk  
    <input type='checkbox' name='ingredient' value='Flour'/>Flour  
            <input type="hidden" name="addDish"/>
            <input type="submit" value="Add Dish"/>
        </form>
    </body>
</html>
