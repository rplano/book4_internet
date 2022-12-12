<%@page import="de.variationenzumthema.internet.login.User"%>
<%
    // put this in a header.jsp file
    User usr = (User)session.getAttribute("Login.User");
    if ( usr == null ) {
        response.sendRedirect("login.jsp");
        return;
    } 
%>
<!DOCTYPE html>
<html>
    <body>
        <%@include file="navigation.jsp" %>
        <h1>Protected</h1>
        <p>Welcome <%= usr.getAlias() %>.</p>     
    </body>
</html>