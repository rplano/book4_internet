<%
    String sessionId = request.getParameter("sessionId");
    if ( sessionId == null ) {
        sessionId = "" + (int)(Math.random()*1000);
    }
%>
<!DOCTYPE html>
<html>
    <body>
        <h1>State with URL-Rewrite</h1>
        <p>Your sessionId is <%= sessionId %></p>
        <p><a href="stateURL.jsp?sessionId=<%= sessionId %>">some link</a></p>
    </body>
</html>