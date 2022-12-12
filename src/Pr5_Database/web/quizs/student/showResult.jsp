<%@page import="de.variationenzumthema.internet.quizs.Question"%>
<%@page import="de.variationenzumthema.internet.quizs.QuestionDao"%>
<%@page import="de.variationenzumthema.internet.quizs.Result"%>
<%@page import="de.variationenzumthema.internet.quizs.ResultDao"%>
<%@page import="de.variationenzumthema.internet.Utility"%>
<%@page import="java.util.Map"%>
<%
    String id = request.getParameter("id");
    if ((id != null) && (Utility.isLong(id))) {
        ResultDao rsltDao = (ResultDao) application.getAttribute("Quizs.ResultDao");
        Result rslt = rsltDao.findById(Long.parseLong(id));
        if (rslt != null) {
            // finally grade results:
            QuestionDao qtnDao = (QuestionDao) application.getAttribute("Quizs.QuestionDao");
            int totalNrOfQuestions = 0;
            int nrOfCorrectAnswers = 0;
            Map<Long, Integer> questionsAndAnswers = rslt.getQuestionIdAnswerIdMap();
            for (Long qstnId : questionsAndAnswers.keySet()) {
                totalNrOfQuestions++;
                int answerId = questionsAndAnswers.get(qstnId);
                Question q = qtnDao.findById(qstnId);
                if (q.getCorrectAnswer() == answerId) {
                    nrOfCorrectAnswers++;
                }
            }
%>            
<!DOCTYPE html>
<html>
    <body>
        <%@include file="../navigation.jsp" %>
        <h2>Results for '<%= rslt.getExam().getExamName() %>'</h2>
<%        
            out.println("<p>You have " + nrOfCorrectAnswers + " of " + totalNrOfQuestions + " questions answered correctly.</p>");
%>
    </body>
</html>
<%            
            return;
        }
    }
    
    // just make sure we did not forget an if or something
    response.sendRedirect("index.jsp");
%>