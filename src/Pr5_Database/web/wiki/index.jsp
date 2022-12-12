<%@page import="de.variationenzumthema.internet.wiki.WikiPage"%>
<%@page import="de.variationenzumthema.internet.wiki.WikiDao"%>
<%!
    public void jspInit() {
        ServletContext application = getServletConfig().getServletContext();

        WikiDao daoWiki = new WikiDao();
        daoWiki.initDatabase();
        application.setAttribute("Wiki.WikiDao", daoWiki);
    }
%>
<!DOCTYPE html>
<html>
    <body>
<%@include file="navigation.jsp" %>

<%
    // main part
    WikiDao daoWiki = (WikiDao) application.getAttribute("Wiki.WikiDao");
    WikiPage pg = daoWiki.findById(pageName);
    if (pg == null) {
        // need to create new page:
        pg = new WikiPage(pageName,"= "+pageName+" =\nNew page.\n");        
        daoWiki.merge(pg);
    }
    out.println(pg.getHTML());
%>
    </body>
</html>
