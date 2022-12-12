<!DOCTYPE html>
<html>
    <body>
        <%@include file="navigation.jsp" %>
        <h1>Protected</h1>
        <p>Welcome ralph.</p>   
        <form action="chirprLogic.jsp" method="POST">
            <textarea name="text" rows="3" cols="40"></textarea>
            <input type="submit" value="Chirp"/>
            <input type="hidden" name="chirp"/>
        </form>         
    </body>
</html>