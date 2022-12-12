<%@page import="java.util.Vector"%>
<%
    if (request.getParameter("reset") != null) {
        application.removeAttribute("Chat");
    }

    String msg = request.getParameter("msg");
    if (msg != null) {
        Vector<String> conversation = (Vector<String>) application.getAttribute("Chat");
        if (conversation == null) {
            conversation = new Vector<String>();
            application.setAttribute("Chat", conversation);
        }
        String id = session.getId();
        id = id.substring(id.length()-2);
        conversation.add(id + ": " + msg);
    }
    response.sendRedirect("chat.jsp");
%>