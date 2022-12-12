<!DOCTYPE html>
<html>
    <body>
<%
    // first add the new cookie:
    String name = request.getParameter("name");
    String value = request.getParameter("value");
    if ((name != null) && (name.length() > 0)) {
        Cookie cookie = new Cookie(name, value);
        cookie.setMaxAge(365 * 24 * 60 * 60);   // one year
        response.addCookie(cookie);
    }
    
    // then list all cookies:
    Cookie[] cookies = request.getCookies();
    out.println( "<ul>");
    if (cookies != null) {
        for (int i = 0; i < cookies.length; i++) {
            out.println("<li>" + cookies[i].getName() + " = " + cookies[i].getValue() + "</li>");
        }
    }
    out.println( "</ul>");
%>
    </body>
</html>