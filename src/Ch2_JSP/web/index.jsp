<%-- 
    MIT License (http://choosealicense.com/licenses/mit/)

    Agrar: 6. Builder

    Draw little blocks ...

    See: http://www.VariationenZumThema.de/
    Author: Ralph P. Lano
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <h1>Ch2: JSP</h1>
        <ul>
<%
    String[] jspPages = {
        "helloJsp", "loop", "time", "randomNumber", 
        "countDown", "passwordCreator", "logging"
    };
    for (int i = 0; i < jspPages.length; i++) {
        out.print("<li><a href='");
        out.print(jspPages[i]);
        out.print(".jsp'>");
        out.print(jspPages[i]);
        out.print("</a></li>");
    }
%>
        </ul>
    </body>
</html>