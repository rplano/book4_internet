<!DOCTYPE html>
<html>
    <head><link rel="stylesheet" type="text/css" href="style.css"></head>
    <body>
        <h1>User</h1>
        <p>Please enter new user information:</p>
        <form action="userLogic.jsp" method="GET">
            <p>
                <label>Last name:</label>
                <input type="text" name="lastName"/>
            </p>      
            <p>
                <label>First name:</label>
                <input type="text" name="firstName"/>
            </p>      
            <p>
                <label>Email:</label>
                <input type="text" name="email"/>
            </p>              
            <p>
                <label> </label>
                <input type="submit" value="Create new user"/>
            </p>       
        </form>
    </body>
</html>