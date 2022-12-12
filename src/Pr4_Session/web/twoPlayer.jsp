<%@page import="de.variationenzumthema.internet.TwoPlayerLogic"%>
<%
    TwoPlayerLogic tpl = (TwoPlayerLogic)application.getAttribute("TwoPlayer");
    if ( tpl == null ) {
        tpl = new TwoPlayerLogic();
        application.setAttribute("TwoPlayer",tpl);
    }
    String myId = session.getId();
    String pairId = tpl.findPartner( myId );
    if ( pairId == null ) {
        // I am first
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="refresh" content="5" />
    </head>
    <body>
        <h1>TwoPlayer</h1>
        <p>Waiting for other player to join...</p>
    </body>
</html>
<%
    } else {
        session.setAttribute("TwoPlayer", pairId);
        response.sendRedirect("twoPlayerChat.jsp");
    }
%>

