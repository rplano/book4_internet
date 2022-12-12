<%@page import="de.variationenzumthema.internet.quizs.Exam"%>
<%@page import="de.variationenzumthema.internet.quizs.ExamDao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <body>
        <%@include file="../navigation.jsp" %>
        <h2>Take an Exam</h2>
        <p>Available exams:</p>
        <ul>
<%
    ExamDao exmDao = (ExamDao) application.getAttribute("Quizs.ExamDao");
    List<Exam> exms = exmDao.findAll();
    for (Exam exm : exms) {
        out.println("<li><a href='takeExam.jsp?id="+exm.getExamName()+"'/>"+exm.getExamName()+"</a></li>");
    }
%>             
        </ul>
    </body>
</html>