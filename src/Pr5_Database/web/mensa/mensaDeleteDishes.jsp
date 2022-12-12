<%@page import="java.util.List"%>
<%@page import="de.variationenzumthema.internet.mensa.Dish"%>
<%@page import="de.variationenzumthema.internet.mensa.DishDao"%>
<!DOCTYPE html>
<html>
    <body>
        <%@include file="mensaNavigation.jsp" %>
        <h2>Delete Dish</h2>
        <form action="mensaLogic.jsp" method="GET">
<%
    DishDao daoDis = (DishDao)application.getAttribute("Mensa.DishDao");
    List<Dish> diss = daoDis.findAll();
    for (Dish dis : diss) {
        out.println("<input type='checkbox' name='dish' value='"+dis.getName()+"'/>"+dis.getName()+"<br/>");
    }
%> 
            <input type="hidden" name="deleteDish"/>
            <input type="submit" value="Delete Dishes"/>
        </form>
    </body>
</html>
