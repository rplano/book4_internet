<%
    String tchr = (String)session.getAttribute("Quizs.Teacher");
    if ( tchr == null ) {
        response.sendRedirect("../index.jsp");
        return;
    } 
%>
<!DOCTYPE html>
<html>
    <body>
        <%@include file="../navigation.jsp" %>
        <h1>Welcome Teacher</h1>
        <p>Hello Teacher!</p>   
    </body>
</html>