<%
    User usr = (User)session.getAttribute("Login.User");
    if ( usr == null ) {
        response.sendRedirect("login.jsp");
        return;
    } 
%>
<!DOCTYPE html>
<html>
    <head><link rel="stylesheet" type="text/css" href="style.css"></head>
    <body>
        <%@include file="navigation.jsp" %>
        <h1>Change Password</h1>
<%
    if ( request.getAttribute("error") != null ) {
        out.println("<strong>"+request.getAttribute("error")+"</strong>");
    }
%>        
        <form action="loginLogic.jsp" method="POST">
            <p>
                <label>Current password:</label>
                <input type="password" name="password"/>
            </p>
            <p>
                <label>New password:</label>
                <input type="password" name="newPassword1"/>
            </p>
            <p>
                <label>Repeat new password:</label>
                <input type="password" name="newPassword2"/>
            </p>      
            <p>
                <label> </label>
                <input type="submit" value="Change Password"/>
            </p>
            <input type="hidden" name="changePassword"/>
        </form>        
    </body>
</html>
