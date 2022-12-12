<%
    int a = (int) (Math.random() * 9) + 1;
    int b = (int) (Math.random() * 9) + 1;
%>
<!DOCTYPE html>
<html>
    <body>
        <h1>Captcha</h1>
        <p>Please verify that you are a not a robot: <br />
            What is the sum of <%= a%> + <%= b%>?</p>
        <form action="captchaLogic.jsp" method="GET">
            <input type="number" name="sum"/>
            <input type="hidden" name="result" value="<%= a + b%>"/>
            <input type="submit" value="Verify"/>
        </form>
    </body>
</html>