<%@page import="de.variationenzumthema.internet.TwoPlayerLogic"%>
<%@page import="java.util.Vector"%>
<%
    TwoPlayerLogic tpl = (TwoPlayerLogic) application.getAttribute("TwoPlayer");
    String pairId = (String) session.getAttribute("TwoPlayer");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="refresh" content="5" />
    </head>
    <body>
<%
    Vector<String> conversation = tpl.receiveMessages(pairId);
    if (conversation != null) {
        for (int i = conversation.size() - 1; i >= 0; i--) {
            out.println(conversation.get(i) + "<br/>");
        }
    } else {
        out.println("Your chat has ended.<br/>");
    }
%>        
    </body>
</html>