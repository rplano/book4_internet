<%@page import="de.variationenzumthema.internet.TwoPlayerLogic"%>
<%
    if (session.getAttribute("TwoPlayer") == null){
        response.sendRedirect("twoPlayer.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <body>
        <h1>TwoPlayerChat</h1>
        <form action="twoPlayerChatLogic.jsp" method="GET">
            <input type="text" name="msg"/>
            <input type="submit" value="Send"/>
            (<a href="twoPlayerChatLogic.jsp?reset=true">Reset</a>)
        </form>        
        <iframe src="twoPlayerChatConversation.jsp" height="100"></iframe>
    </body>
    </body>
</html>