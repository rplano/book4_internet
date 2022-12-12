<%
    // try this from different tabs, windows and browsers
    
    String sessionId = null;
    
    // first check if cookie was set already
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (int i=0; i<cookies.length; i++) {
            if (cookies[i].getName().equals("sessionId")) {
                sessionId = cookies[i].getValue();
            }
        }        
    }
    
    // if no cookie was found create one
    if ( sessionId == null ) {
        sessionId = "" + (int)(Math.random()*1000);
        Cookie cookie = new Cookie("sessionId", sessionId);
        cookie.setMaxAge(1 * 60);   // expire in 1 min
        response.addCookie(cookie);
        response.sendRedirect("stateCookie.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <body>
        <h1>State with Cookie</h1>
        <p>Your sessionId is <%= sessionId %></p>
        <p><a href="stateCookie.jsp">some link</a></p>
    </body>
</html>