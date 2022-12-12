<%@page import="de.variationenzumthema.internet.MensaIngredientDao"%>
<%@page import="de.variationenzumthema.internet.Dish"%>
<%@page import="java.util.List"%>
<%@page import="de.variationenzumthema.internet.Ingredient"%>
<%@page import="de.variationenzumthema.internet.MensaDishDao"%>
<%!    
    public void jspInit() {
        ServletContext application = getServletConfig().getServletContext();

        MensaIngredientDao daoIng = new MensaIngredientDao();
        daoIng.initDatabase();
        application.setAttribute("Mensa.IngredientDao", daoIng);
        
        MensaDishDao daoDish = new MensaDishDao();
        daoDish.initDatabase(daoIng);
        application.setAttribute("Mensa.DishDao", daoDish);
    }
%>
<!DOCTYPE html>
<html>
    <body>
        <h2>Mensa</h2>
        <p>Available dishes:</p>
        <ul>
<%
    MensaDishDao daoDish = (MensaDishDao)application.getAttribute("Mensa.DishDao");
    List<Dish> dishs = daoDish.findAll();
    for (Dish di : dishs) {
        out.println("<li>"+di+"</li>");
    }
%>            
        </ul>
        <p>Available ingredients:</p>
        <ul>
<%
    MensaIngredientDao daoIng = (MensaIngredientDao)application.getAttribute("Mensa.IngredientDao");
    List<Ingredient> ings = daoIng.findAll();
    for (Ingredient ing : ings) {
        out.println("<li>"+ing+"</li>");
    }
%>            
        </ul>
    </body>
</html>
