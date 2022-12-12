<%@page import="de.variationenzumthema.internet.wiki.WikiPage"%>
<%@page import="de.variationenzumthema.internet.wiki.WikiDao"%>
<!DOCTYPE html>
<html>
    <body>
<%@include file="navigation.jsp" %>

        <form action="wikiLogic.jsp" method="POST">
            <textarea name="text" rows="10" cols="50">
<%
    WikiDao daoWiki = (WikiDao)application.getAttribute("Wiki.WikiDao");
    WikiPage pg = daoWiki.findById(pageName);
    if (pg == null) {
        pg = daoWiki.findById("home");
    }
    out.print(pg.getContent());
%></textarea>
            <input type="hidden" name="page" value="<%= pageName %>"/>
            <input type="hidden" name="edit"/>
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
