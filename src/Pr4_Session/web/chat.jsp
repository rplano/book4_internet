<!DOCTYPE html>
<html>
    <body>
        <h1>Chat</h1> 
        <form action="chatLogic.jsp" method="GET">
            <input type="text" name="msg"/>
            <input type="submit" value="Send"/>
            (<a href="chatLogic.jsp?reset=true">Reset</a>)
        </form>        
        <iframe src="chatConversation.jsp" height="100"></iframe>
    </body>
</html>