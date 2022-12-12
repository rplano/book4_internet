<%@page import="java.util.List"%>
<%@page import="de.variationenzumthema.internet.mensa.IngredientDao"%>
<%@page import="de.variationenzumthema.internet.mensa.DishDao"%>
<%@page import="de.variationenzumthema.internet.mensa.Ingredient"%>
<%@page import="de.variationenzumthema.internet.mensa.Dish"%>
<%!    
    public void jspInit() {
        ServletContext application = getServletConfig().getServletContext();

        IngredientDao daoIng = new IngredientDao();
        daoIng.initDatabase();
        application.setAttribute("Mensa.IngredientDao", daoIng);
        
        DishDao daoDish = new DishDao();
        daoDish.initDatabase(daoIng);
        application.setAttribute("Mensa.DishDao", daoDish);
    }
%>
<!DOCTYPE html>
<html>
    <body>
        <%@include file="mensaNavigation.jsp" %>
        <h2>Mensa - Menu</h2>
        <p>Todays menu:</p>
        <ul>
<%
    DishDao daoDish = (DishDao)application.getAttribute("Mensa.DishDao");
    List<Dish> dishs = daoDish.findAll();
    for (Dish di : dishs) {
        out.println("<li>"+di.getName()+"</li>");
    }
%>            
        </ul>
    </body>
</html>
