<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Map"%>
<%
    String alias = request.getParameter("alias");
    Map<String, List<String>> users = (Map<String, List<String>>) application.getAttribute("Messenger");
    List<String> msgs = users.get(alias); 
%>
<!DOCTYPE html>
<html>
    <body>
        <h1>Messenger Read</h1> 
        <p><a href='messengerHome.jsp?alias=<%= alias %>'>Home</a></p>
        <p>Your messages:</p>
        <ul>
        <%
            for ( int i=msgs.size()-1; i>=0; i-- ) {
                out.println("<li>"+msgs.get(i) +"</li>");
            }
        %>        
        </ul>
    </body>
</html>