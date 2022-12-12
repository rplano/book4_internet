<%
    int a = (int) (Math.random() * 9) + 1;
    int b = (int) (Math.random() * 9) + 1;
%>
<!DOCTYPE html>
<html>
    <head><link rel="stylesheet" type="text/css" href="style.css"></head>
    <body>
        <%@include file="navigation.jsp" %>
        <h1>Registration</h1>
<%
    if ( request.getAttribute("error") != null ) {
        out.println("<strong>"+request.getAttribute("error")+"</strong>");
    }
%>        
        <form action="loginLogic.jsp" method="POST">
            <p>
                <label>Email:</label>
                <input type="text" name="emailId"/>
            </p>
            <p>
                <label>Alias:</label>
                <input type="text" name="alias"/>
            </p>
            <p>
                <label>Password:</label>
                <input type="password" name="password"/>
            </p>
            <p>
                <label>Favorite color:</label>
                <input type="text" name="favoriteColor"/>
            </p>
            <p>
                <label>The sum of <%= a%> + <%= b%>?</label>
                <input type="text" name="sum" size="4"/>
                <input type="hidden" name="result" value="<%= a + b%>"/>
            </p>
            <p>
                <label>Accept <a href="terms.jsp">Terms</a>: </label>
                <input type="checkbox" name="acceptTerms"/>
            </p>            
            <p>
                <label> </label>
                <input type="submit" value="Register"/>
            </p>
            <input type="hidden" name="registration"/>
        </form>
    </body>
</html>
