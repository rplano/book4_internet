<%@page import="de.variationenzumthema.internet.chirpr.Chirp"%>
<%@page import="java.util.Set"%>
<%@page import="de.variationenzumthema.internet.chirpr.BirdDao"%>
<%@page import="de.variationenzumthema.internet.chirpr.Bird"%>
<%
    String birdId = request.getParameter("id");
    if ( birdId == null ) {
        response.sendRedirect("protected.jsp");
        return;       
    }

    BirdDao brdDao = (BirdDao)application.getAttribute("Chirpr.BirdDao");
    Bird brd = brdDao.findById(birdId);
    if ( brd == null ) {
        response.sendRedirect("protected.jsp");
        return;       
    }
%>
<!DOCTYPE html>
<html>
    <body>
        <%@include file="navigation.jsp" %>
        <h1>Bird: <%= brd.getEmailId() %></h1>
        <ul>
<%
    Set<Chirp> chrps = brd.getChirps();
    for (Chirp crp : chrps) {
        out.println("<li>"+crp.getTextWithLinks()+"</li>");
    }
%>            
        </ul>      
    </body>
</html>
