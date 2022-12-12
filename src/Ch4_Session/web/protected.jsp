<%
    String user = (String)session.getAttribute("User");
    if ( user == null ) {
        response.sendRedirect("login.jsp");
        return;
    } 
%>
<!DOCTYPE html>
<html>
    <body>
        <%@include file="navigation.jsp" %>
        <h1>Protected</h1>
        <p>Welcome <%= user %>.</p>
    </body>
</html>
