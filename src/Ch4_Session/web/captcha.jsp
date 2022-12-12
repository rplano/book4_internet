<%
    int a = (int) (Math.random() * 9) + 1;
    int b = (int) (Math.random() * 9) + 1;
    session.setAttribute("correctAnswer", a+b);
%>
<!DOCTYPE html>
<html>
    <body>
        <h1>Captcha</h1>
        <p>Please verify that you are a not a robot: <br />
            What is the sum of <%= a%> + <%= b%>?</p>
        <form action="captchaLogic.jsp" method="GET">
            <input type="number" name="sum"/>
            <input type="submit" value="Verify"/>
        </form>
    </body>
</html>