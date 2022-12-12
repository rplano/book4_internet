<%@page import="de.variationenzumthema.internet.quizs.ExamDao"%>
<%@page import="de.variationenzumthema.internet.quizs.Exam"%>
<%@page import="de.variationenzumthema.internet.Utility"%>
<%@page import="de.variationenzumthema.internet.quizs.QuestionDao"%>
<%@page import="de.variationenzumthema.internet.quizs.Question"%>
<%@page import="de.variationenzumthema.internet.quizs.StudentDao"%>
<%@page import="de.variationenzumthema.internet.quizs.Student"%>
<%
    // new question
    if (request.getParameter("newQuestion") != null) {
        // let reflection do most of the work
        Question q = (Question) Utility.extractObjectFromRequest(Question.class, request);
        // now add what is missing:
        for (int i = 1; i <= 3; i++) {
            String answer = request.getParameter("answer" + i);
            if ((answer != null)&&(answer.length()>1)) {
                q.addAnswer(answer);
            }
        }

        QuestionDao qstnDao = (QuestionDao) application.getAttribute("Quizs.QuestionDao");
        qstnDao.save(q);
        response.sendRedirect("question.jsp");
        return;
    }

    // new exam
    if (request.getParameter("newExam") != null) {
        // let reflection do most of the work
        Exam exm = (Exam) Utility.extractObjectFromRequest(Exam.class, request);
        // now add what is missing:
        QuestionDao qstnDao = (QuestionDao) application.getAttribute("Quizs.QuestionDao");
        String[] params = request.getParameterValues("question");
        for (int i = 0; i < params.length; i++) {
            Long id = Long.parseLong(params[i]);
            Question q = qstnDao.findById(id);
            if (q != null) {            
                exm.addQuestion(q);
            }
        }      
        
        ExamDao exmDao = (ExamDao) application.getAttribute("Quizs.ExamDao");
        exmDao.save(exm);  
        response.sendRedirect("index.jsp");
        return;
    }

    // just make sure we did not forget an if or something
    response.sendRedirect("index.jsp");
%>