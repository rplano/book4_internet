<%@page import="java.util.Vector"%>
<html>
    <body>
        <h1>Guestbook</h1>
<%
    Vector<String> comments = (Vector<String>) application.getAttribute("Guestbook");
    if (comments == null) {
        comments = new Vector<String>();
        application.setAttribute("Guestbook", comments);
    }
    out.println("<ul>");
    for (int i = 0; i < comments.size(); i++) {
        String msg = comments.get(i);
        out.println("<li>");
        out.println(msg);
        out.println("  <a href='guestbookLogic.jsp?id=" + i + "'>(delete)</a>");
        out.println("</li>");
    }
    out.println("</ul>");
%>
        <form action="guestbookLogic.jsp" method="POST">
            <textarea name="comment" cols="40" rows="1"></textarea><br />
            <input type="submit" value="Post new comment" />
        </form>
    </body>
</html>