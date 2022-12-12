<%@page import="java.util.List"%>
<%@page import="de.variationenzumthema.internet.wiki.WikiPage"%>
<%@page import="de.variationenzumthema.internet.wiki.WikiDao"%>
<%
    // user edited a page:
    if (request.getParameter("edit") != null) {
        String pageName = request.getParameter("page");
        String text = request.getParameter("text");
        if ((pageName != null) && (text != null)) {
            WikiDao daoWiki = (WikiDao) application.getAttribute("Wiki.WikiDao");
            WikiPage pg = daoWiki.findById(pageName);
            pg.setContent(text);
            daoWiki.merge(pg);
        }
        response.sendRedirect("index.jsp?page=" + pageName);
        return;
    }

    // user wants to search:
    if (request.getParameter("search") != null) {
        String searchTerm = request.getParameter("searchTerm");
        if ((searchTerm != null) && (searchTerm.length() > 3)) {
            WikiDao daoWiki = (WikiDao) application.getAttribute("Wiki.WikiDao");
            List<WikiPage> pgs = daoWiki.search(searchTerm);
            out.println("<html><body><h1>Result</h1><ul>");
            for (WikiPage pg : pgs) {
                String pgName = pg.getPageId();
                out.println("<li><a href='index.jsp?page="+pgName+"'>" + pgName + "</a></li>");
            }
            out.println("</ul></body></html>");
            return;
        }
        response.sendRedirect("search.jsp");
        return;
    }

    response.sendRedirect("index.jsp");
%>