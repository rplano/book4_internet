<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="de.variationenzumthema.internet.mensa.IngredientDao"%>
<%@page import="de.variationenzumthema.internet.mensa.DishDao"%>
<%@page import="de.variationenzumthema.internet.mensa.Ingredient"%>
<%@page import="de.variationenzumthema.internet.mensa.Dish"%>
<%
    // add new ingredient
    if ( request.getParameter("addIngredient") != null ) {
        String name = request.getParameter("name");
        String size = request.getParameter("size");
        double calories = Double.parseDouble(request.getParameter("calories"));
        if (name != null) {
            Ingredient ingr = new Ingredient(name,size,calories);
            IngredientDao daoIng = (IngredientDao)application.getAttribute("Mensa.IngredientDao");
            daoIng.merge(ingr);
        }
        response.sendRedirect("mensaListIngredients.jsp");
        return;
    } 
    
    // delete ingredient
    if ( request.getParameter("deleteIngredient") != null ) {
        IngredientDao daoIng = (IngredientDao)application.getAttribute("Mensa.IngredientDao");
        String[] ingreds = request.getParameterValues("ingredient"); 
        for (String ing : ingreds) {
            daoIng.delete(daoIng.findById(ing));
        }
        response.sendRedirect("mensaListIngredients.jsp");
        return;
    } 
    
    // add new dish
    if ( request.getParameter("addDish") != null ) {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String calories = request.getParameter("calories");
        String[] ingreds = request.getParameterValues("ingredient"); 
        if (name != null) {
            IngredientDao daoIng = (IngredientDao)application.getAttribute("Mensa.IngredientDao");
            Set<Ingredient> ingredients = new HashSet<Ingredient>();
            for (String ing : ingreds) {
                ingredients.add( daoIng.findById(ing) );
            }
            Dish di = new Dish(name,price,ingredients);
            DishDao daoDis = (DishDao)application.getAttribute("Mensa.DishDao");
            daoDis.merge(di);
        }
        response.sendRedirect("mensaListDishes.jsp");
        return;
    }
    
    // delete dish
    if ( request.getParameter("deleteDish") != null ) {
        DishDao daoDis = (DishDao)application.getAttribute("Mensa.DishDao");
        String[] dishs = request.getParameterValues("dish"); 
        for (String dis : dishs) {
            daoDis.delete(daoDis.findById(dis));
        }
        response.sendRedirect("mensaListDishes.jsp");
        return;
    } 
        
    response.sendRedirect("mensa.jsp");
%>