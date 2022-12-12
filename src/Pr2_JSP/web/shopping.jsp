<%@page import="java.util.Vector"%>
<!DOCTYPE html>
<html>
    <body>
        <h1>Shopping</h1>
<%
    Vector<String> cart = new Vector<String>();
    cart.add("Butter");
    cart.add("Milk");
    cart.add("Honey");
    
    out.println( "<ul>" );
    for (int i = 0; i < cart.size(); i++) {
        String item = cart.get(i);
        out.println( "<li>" );
        out.println( item );
        out.println( "</li>" );
    }
    out.println( "</ul>" );
%>
    </body>
</html>