<!DOCTYPE html>
<html>
    <body>
        <%@include file="navigation.jsp" %>
        <h1>Login</h1>
        <form action="loginLogic.jsp" method="GET">
            UserID:  <input type="text" name="userId"/><br/>
            Password:<input type="password" name="password"/><br/>
            <input type="submit" value="Login"/>
        </form>
    </body>
</html>