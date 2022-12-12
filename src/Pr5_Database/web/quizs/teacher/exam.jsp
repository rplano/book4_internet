<%@page import="de.variationenzumthema.internet.quizs.Question"%>
<%@page import="de.variationenzumthema.internet.quizs.QuestionDao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <body>
        <%@include file="../navigation.jsp" %>
        <h2>Create a New Exam</h2>
        <form action="quizsLogic.jsp" method="POST">
            Exam name: <input type="text" name="examName" size="30"/><br/>            
<%
    QuestionDao qtnDao = (QuestionDao)application.getAttribute("Quizs.QuestionDao");
    List<Question> qtns = qtnDao.findAll();
    for (Question q : qtns) {
        out.println("<input type='checkbox' name='question' value='"+q.getId()+"'/>"+q.getQuestion()+"<br/>");
    }
%>             
            <input type="hidden" name="newExam"/>
            <input type="submit" value="Create Exam"/>
        </form>        
    </body>
</html>
