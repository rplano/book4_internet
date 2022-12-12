<%@page import="java.util.Vector"%>
<!DOCTYPE html>
<html>
    <body>
        <h1>Shopping</h1>
<%
    Vector<String> cart = (Vector<String>)session.getAttribute("Cart");
    if ( cart == null ) {
        cart = new Vector<String>();
        session.setAttribute("Cart", cart);
    }
    out.println( "<ul>" );
    for (int i = 0; i < cart.size(); i++) {
        String item = cart.get(i);
        out.println( "<li>" );
        out.println( item );
        out.println( "  <a href='shoppingLogic.jsp?id="+i+"'>(delete)</a>" );
        out.println( "</li>" );
    }
    out.println( "</ul>" );
%>            
    <form action="shoppingLogic.jsp" method="POST">
        <textarea name="item" rows="1" cols="40"></textarea>
        <input type="submit" value="Add to cart" />
    </form>
    </body>
</html>