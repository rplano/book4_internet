<!DOCTYPE html>
<html>
    <body>
        <%@include file="navigation.jsp" %>
        <h2>Delete Dish</h2>
        <form action="index.jsp" method="GET">
<input type='checkbox' name='dish' value='Pancake'/>Pancake<br/>
<input type='checkbox' name='dish' value='Scrambled Eggs'/>Scrambled Eggs<br/>
            <input type="hidden" name="deleteDish"/>
            <input type="submit" value="Delete Dishes"/>
        </form>
    </body>
</html>
