<%@page import="java.util.Vector"%>
<%
    // add a new item
    String item = request.getParameter("item");
    if ( (item != null) && (item.length() > 3) && (item.length() < 1000) ) {
        Vector<String> cart = (Vector<String>)session.getAttribute("Cart");
        cart.add( item );
    }
    
    // delete existing item
    String idToDelete = request.getParameter("id");
    if ( idToDelete != null) {
        Vector<String> cart = (Vector<String>)session.getAttribute("Cart");
        int id = Integer.parseInt( idToDelete );
        if ( ( id >= 0 ) && ( id < cart.size() ) ) {
            cart.remove( id );
        }
    }
    response.sendRedirect("shopping.jsp");
    return;
%>