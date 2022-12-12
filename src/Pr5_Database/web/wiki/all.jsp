<%@page import="java.util.List"%>
<%@page import="de.variationenzumthema.internet.wiki.WikiPage"%>
<%@page import="de.variationenzumthema.internet.wiki.WikiDao"%>
<!DOCTYPE html>
<html>
    <body>
        <%@include file="navigation.jsp" %>
        <p>All pages:</p>
<%    
    WikiDao daoWiki = (WikiDao) application.getAttribute("Wiki.WikiDao");
    List<WikiPage> pgs = daoWiki.findAll();
    out.println("<ul>");
    for (WikiPage pg : pgs) {
        String pgName = pg.getPageId();
        out.println("<li><a href='index.jsp?page="+pgName+"'>" + pgName + "</a></li>");
    }
    out.println("</ul>");
%>
    </body>
</html>
