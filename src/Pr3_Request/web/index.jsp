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
        <h1>Pr3: Request</h1>
        <ul>
<%
    String[] jspPages = {
        "captcha", "calculator", "cookie",
        "editor", "upload", "stateURL", "stateCookie", 
        "numberGuess", "guestBook", "highScore", "pizzaMenu",
        "escapeXml",
        "i18n/index", "register/register",  "register/preFillForm"
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