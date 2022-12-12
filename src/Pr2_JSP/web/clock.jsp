
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="refresh" content="1" />
    </head>
    <body><h1>
        <%
            SimpleDateFormat formater = 
                    new SimpleDateFormat("HH:mm:ss");
            Date now = new Date();
            out.println(formater.format(now));
        %>
    </h1></body>
</html>
