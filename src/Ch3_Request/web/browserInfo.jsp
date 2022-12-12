<%@page import="java.util.Enumeration"%>
<!DOCTYPE html>
<html>
    <body>
        <h1>BrowserInfo</h1>
<%
    out.println( "Browsers speaks: " + request.getProtocol() + "<br />");
    out.println( "Browsers IP: " + request.getRemoteAddr() + "<br />");
    out.println( "Header names and values:<br />");
    Enumeration<String> names = request.getHeaderNames();
    out.println( "<ul>");
    while ( names.hasMoreElements() ) {
        String headerName = names.nextElement();
        out.println( "<li>" + headerName +": " + request.getHeader(headerName) + "</li>");        
    }
    out.println( "</ul>");
%>
    </body>
</html>