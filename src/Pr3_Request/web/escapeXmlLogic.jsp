<%@page import="de.variationenzumthema.internet.Utility"%>
<%
    String text = request.getParameter("text");
    if (request.getParameter("escape") != null) {
        out.println(Utility.escapeXml(text));
    } else {
        out.println(text);
    }
%>