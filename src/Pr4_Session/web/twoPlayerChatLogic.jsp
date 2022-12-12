<%@page import="de.variationenzumthema.internet.TwoPlayerLogic"%>
<%@page import="java.util.Vector"%>
<%
    TwoPlayerLogic tpl = (TwoPlayerLogic)application.getAttribute("TwoPlayer");    
    String pairId = (String)session.getAttribute("TwoPlayer");
    
    if (request.getParameter("reset") != null) {
        tpl.removeFromPairMap(pairId);
        session.removeAttribute("TwoPlayer");
        response.sendRedirect("index.jsp");
        return;
    }

    String msg = request.getParameter("msg");
    if (msg != null) {
        Vector<String> conversation = tpl.receiveMessages(pairId);
        String id = session.getId();
        id = id.substring(id.length()-2);
        conversation.add(id + ": " + msg);
    }
    response.sendRedirect("twoPlayerChat.jsp");
%>