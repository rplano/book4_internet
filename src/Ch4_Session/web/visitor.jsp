<%
    Integer counter = (Integer)application.getAttribute("visitorCounter");
    if ( counter == null ) {
        counter = 1;
    } else {
        counter++;
    }
    application.setAttribute("visitorCounter", counter);
%>
<html>
    <body>
        <h2>Welcome, Visitor Nr. <%= counter %></h2>
    </body>
</html>