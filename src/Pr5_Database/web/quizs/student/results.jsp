<%@page import="java.util.Set"%>
<%@page import="de.variationenzumthema.internet.quizs.Student"%>
<%@page import="de.variationenzumthema.internet.quizs.Result"%>
<%@page import="de.variationenzumthema.internet.quizs.ResultDao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <body>
        <%@include file="../navigation.jsp" %>
        <h2>Check your Results</h2>
        <p>Available exams taken:</p>
        <ul>
<%
    Student stdnt = (Student)session.getAttribute("Quizs.Student");
    //ResultDao rsltDao = (ResultDao)application.getAttribute("Quizs.ResultDao");
    //List<Result> rslts = rsltDao.findAllByStudent(stdnt);
    Set<Result> rslts = stdnt.getExamResults();
    for (Result rslt : rslts) {
        out.println("<li><a href='showResult.jsp?id="+rslt.getId()+"'/>"+rslt.getExam().getExamName()+" ("+rslt.getDateTestTaken()+"}</a></li>");
    }
%>             
        </ul>
    </body>
</html>