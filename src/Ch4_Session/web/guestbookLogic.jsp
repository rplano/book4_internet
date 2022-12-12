<%@page import="java.util.Vector"%>
<%
    // add a new guestbook entry
    String comment = request.getParameter("comment");
    if ( (comment != null) && (comment.length() > 5) && (comment.length() < 1000) ) {
        Vector<String> comments = (Vector<String>)application.getAttribute("Guestbook");
        comments.add( comment );
    }
    
    // delete existing guestbook entry
    String idToDelete = request.getParameter("id");
    if ( idToDelete != null) {
        Vector<String> comments = (Vector<String>)application.getAttribute("Guestbook");
        int id = Integer.parseInt( idToDelete );
        if ( ( id >= 0 ) && ( id < comments.size() ) ) {
            comments.remove( id );
        }
    }
    response.sendRedirect("guestbook.jsp");
    return;
%>