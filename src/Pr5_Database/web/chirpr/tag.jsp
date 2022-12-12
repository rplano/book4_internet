<%@page import="de.variationenzumthema.internet.chirpr.Chirp"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page import="de.variationenzumthema.internet.chirpr.Tag"%>
<%@page import="de.variationenzumthema.internet.chirpr.TagDao"%>
<%
    String tagId = request.getParameter("id");
    if ( tagId == null ) {
        response.sendRedirect("protected.jsp");
        return;       
    }

    TagDao tagDao = (TagDao)application.getAttribute("Chirpr.TagDao");
    Tag tg = tagDao.findById(tagId.toLowerCase());
    if ( tg == null ) {
        response.sendRedirect("protected.jsp");
        return;       
    }
%>
<!DOCTYPE html>
<html>
    <body>
        <%@include file="navigation.jsp" %>
        <h1>Tag: #<%= tg.getTagId() %></h1>
        <ul>
<%
    Set<Chirp> chrps = tg.getChirps();
    for (Chirp crp : chrps) {
        out.println("<li>"+crp.getTextWithLinks()+"</li>");
    }
%>            
        </ul>      
    </body>
</html>
