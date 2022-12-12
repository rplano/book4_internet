<%@page import="java.util.Date"%>
<%@page import="java.awt.Color"%>
<%@page import="de.variationenzumthema.internet.Utility"%>
<%@page import="de.variationenzumthema.internet.User"%>
<!DOCTYPE html>
<html>
    <head><link rel="stylesheet" type="text/css" href="../style.css">
<%
    User usr = new User("ralph@lano.de", Color.GREEN, true, 42, 1.73, new Date());
    String javaScript = Utility.createJavaScriptFromObject(usr);
    out.println(javaScript);
%>
    </head>
    <body onload="fillFormFromJS()">
        <h1>Pre-Fill</h1>
<%
    if ( request.getAttribute("error") != null ) {
        out.println("<strong>"+request.getAttribute("error")+"</strong>");
    }
%>        
        <form action="registerLogic.jsp" method="POST">
            <p>
                <label>Email:</label>
                <input type="text" name="emailId"/>
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
                <label>Vegetarian? (true/false):</label>
                <input type="text" name="vegetarian"/>
            </p>      
            <p>
                <label>Age:</label>
                <input type="text" name="age"/>
            </p>        
            <p>
                <label>Size: (e.g. 1.76)</label>
                <input type="text" name="size"/>
            </p>    
            <p>
                <label>Birth Date: (2016-08-17)</label>
                <input type="date" name="bday">    
            </p>         
            <p>
                <label> </label>
                <input type="submit" value="Register"/>
            </p>
        </form>
    </body>
</html>