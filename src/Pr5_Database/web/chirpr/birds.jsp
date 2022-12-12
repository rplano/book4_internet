<%@page import="de.variationenzumthema.internet.chirpr.Bird"%>
<%@page import="java.util.List"%>
<%@page import="de.variationenzumthema.internet.chirpr.BirdDao"%>
<!DOCTYPE html>
<html>
    <body>
        <%@include file="navigation.jsp" %>
        <h1>Birds</h1>
        <ul>
<%
    BirdDao birdDao = (BirdDao)application.getAttribute("Chirpr.BirdDao");
    List<Bird> brds = birdDao.findAll();
    for (Bird brd : brds) {
        out.println("<li><a href='bird.jsp?id="+brd.getEmailId()+"'>"+brd.getEmailId()+"</a></li>");
    }
%>            
        </ul>      
    </body>
</html>
