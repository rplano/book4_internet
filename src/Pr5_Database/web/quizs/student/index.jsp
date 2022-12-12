<%@page import="de.variationenzumthema.internet.quizs.Student"%>
<%
    Student stdnt = (Student)session.getAttribute("Quizs.Student");
    if ( stdnt == null ) {
        response.sendRedirect("../index.jsp");
        return;
    } 
%>
<!DOCTYPE html>
<html>
    <body>
        <%@include file="../navigation.jsp" %>
        <h1>Welcome Student</h1>
        <p>Hello <%= stdnt.getEmailId() %>!</p>           
    </body>
</html>