<!DOCTYPE html>
<html>
    <head><link rel="stylesheet" type="text/css" href="style.css"></head>
    <body>
        <%@include file="navigation.jsp" %>
        <h1>Login</h1>
        <form action="protected.jsp" method="POST">
            <p>
                <label>Email:</label>
                <input type="text" name="emailId"/>
            </p>
            <p>
                <label>Password:</label>
                <input type="password" name="password"/>
            </p>       
            <p>
                <label> </label>
                <input type="submit" value="Login"/>
            </p>
            <input type="hidden" name="login"/>
        </form>
        (<a href="forgotPassword.jsp">Forgot Password</a>)
    </body>
</html>
