<!DOCTYPE html>
<html>
    <body>
        <h1>Chirpr</h1>
        <p>Please identify yourself:</p>
        <form action="protected.jsp" method="POST">
            <p>
                <label>Email:</label>
                <input type="text" name="emailId"/>
            </p>
            <p>
                <label> </label>
                <input type="submit" value="Login"/>
            </p>
            <input type="hidden" name="login"/>
        </form>        
    </body>
</html>
