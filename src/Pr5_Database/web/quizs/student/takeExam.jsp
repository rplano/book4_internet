<%@page import="de.variationenzumthema.internet.quizs.Question"%>
<%@page import="de.variationenzumthema.internet.quizs.Exam"%>
<%@page import="de.variationenzumthema.internet.quizs.ExamDao"%>
<%@page import="java.util.List"%>
<%
    String examName = request.getParameter("id");
    if (examName != null) {
        // TODO: check if exam already taken
        ExamDao exmDao = (ExamDao) application.getAttribute("Quizs.ExamDao");
        Exam exm = exmDao.findById(examName);
        if (exm != null) {
%>            
<!DOCTYPE html>
<html>
    <body>
        <h2><%= exm.getExamName() %></h2>
        <form action="gradeExam.jsp" method="POST">
            <hr/>
<%     
    List<Question> qstns = exm.getQuestions();
    for (Question q : qstns) {
        out.println(q.getQuestion()+"<br/>");
        List<String> answs = q.getAnswers();
        for (int i=0; i<answs.size(); i++) {
            out.println("<input type='radio' name='"+q.getId()+"' value='"+(i+1)+"'/>"+answs.get(i)+"<br/>");            
        }
        out.println("<hr/>");
    }
%>
            <input type="hidden" name="examName" value="<%= exm.getExamName() %>"/>
            <input type="submit" value="Submit Answers"/>
        </form>        
    </body>
</html>
<%            
            return;
        }
    }
    
    // just make sure we did not forget an if or something
    response.sendRedirect("index.jsp");
%>