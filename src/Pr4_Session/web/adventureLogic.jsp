<%@page import="de.variationenzumthema.internet.Adventure"%>
<%
    if (request.getParameter("reset") != null) {
        session.removeAttribute("Adventure");
    } else {
        String room = request.getParameter("room");
        Adventure advntr = (Adventure) session.getAttribute("Adventure");
        advntr.setCurrentRoom(room);
    }
    response.sendRedirect("adventure.jsp");
%>