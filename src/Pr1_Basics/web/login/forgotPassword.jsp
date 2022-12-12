<!DOCTYPE html>
<html>
    <head><link rel="stylesheet" type="text/css" href="style.css"></head>
    <body>
        <%@include file="navigation.jsp" %>
        <h1>Forgot Password</h1>        
        <p>Please, enter your email address below.<br/>
            A new password will be send to you.</p>
        <form action="verifyEmail.jsp" method="POST">

            <p>
                <label>Email:</label>
                <input type="text" name="emailId"/>
            </p>
            <p>
                <label>Favorite color:</label>
                <input type="text" name="favoriteColor"/>
            </p>    
            <p>
                <label> </label>
                <input type="submit" value="Request new password"/>
            </p>
            <input type="hidden" name="forgotPassword"/>
        </form>
    </body>
</html>
