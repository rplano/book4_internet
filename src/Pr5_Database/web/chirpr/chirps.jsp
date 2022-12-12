<%@page import="de.variationenzumthema.internet.chirpr.Chirp"%>
<%@page import="java.util.List"%>
<%@page import="de.variationenzumthema.internet.chirpr.ChirpDao"%>
<!DOCTYPE html>
<html>
    <body>
        <%@include file="navigation.jsp" %>
        <h1>Chirps</h1>
        <ul>
<%
    ChirpDao chirpDao = (ChirpDao)application.getAttribute("Chirpr.ChirpDao");
    List<Chirp> chrps = chirpDao.findAll();
    for (Chirp crp : chrps) {
        out.println("<li>"+crp.getTextWithLinks()+"</li>");
    }
%>            
        </ul>      
    </body>
</html>
