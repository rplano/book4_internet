<%@page import="java.util.Vector"%>
<%    
    Vector<String> conversation = (Vector<String>)application.getAttribute("Chat");
    if ( conversation == null ) {
        conversation = new Vector<String>();
        application.setAttribute("Chat", conversation);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="refresh" content="5" />
    </head>
    <body>
<%
    for (int i=conversation.size()-1; i>=0; i--) {
        out.println( conversation.get(i) +"<br/>" );
    }
%>        
    </body>
</html>