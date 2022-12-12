<%@page import="de.variationenzumthema.internet.chirpr.Tag"%>
<%@page import="java.util.List"%>
<%@page import="de.variationenzumthema.internet.chirpr.TagDao"%>
<!DOCTYPE html>
<html>
    <body>
        <%@include file="navigation.jsp" %>
        <h1>Tags</h1>
        <ul>
<%
    TagDao tagDao = (TagDao)application.getAttribute("Chirpr.TagDao");
    List<Tag> tags = tagDao.findAll();
    for (Tag tg : tags) {
        out.println("<li><a href='tag.jsp?id="+tg.getTagId()+"'>#"+tg.getTagId()+"</a></li>");
    }
%>            
        </ul>      
    </body>
</html>
