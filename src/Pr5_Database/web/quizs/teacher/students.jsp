<%@page import="de.variationenzumthema.internet.quizs.StudentDao"%>
<%@page import="de.variationenzumthema.internet.quizs.Student"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <body>
        <%@include file="../navigation.jsp" %>
        <h2>List all Students</h2>
        <ul>
<%
    StudentDao stdDao = (StudentDao)application.getAttribute("Quizs.StudentDao");
    List<Student> stdnts = stdDao.findAll();
    for (Student stdnt : stdnts) {
        out.println("<li>"+stdnt+"</li>");
    }
%>            
        </ul>         
    </body>
</html>
