<%@page import="de.variationenzumthema.internet.quizs.Question"%>
<%@page import="de.variationenzumthema.internet.quizs.QuestionDao"%>
<%@page import="de.variationenzumthema.internet.quizs.ResultDao"%>
<%@page import="de.variationenzumthema.internet.quizs.StudentDao"%>
<%@page import="de.variationenzumthema.internet.quizs.Exam"%>
<%@page import="de.variationenzumthema.internet.quizs.ExamDao"%>
<%@page import="de.variationenzumthema.internet.quizs.Student"%>
<%@page import="de.variationenzumthema.internet.quizs.Result"%>
<%@page import="de.variationenzumthema.internet.Utility"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Map"%>
<%
    String examName = request.getParameter("examName");
    Map<String,String[]> paramsMap = request.getParameterMap();
    if ( (examName != null) && (paramsMap != null)) {
        // first get exam
        ExamDao exmDao = (ExamDao) application.getAttribute("Quizs.ExamDao");
        Exam exm = exmDao.findById(examName);
        
        if (exm != null) {
            // then get and store results
            Result rslt = new Result(exm, new Date());
            for (String qstnId : paramsMap.keySet()) {
                if ( Utility.isLong(qstnId)) {
                    String ans = paramsMap.get(qstnId)[0];  // only single multiple choice!
                    //System.out.println(qstnId +", "+ ans + "<br/>");
                    rslt.addToQuestionIdAnswerIdMap(qstnId, ans);                    
                }
            }
            //out.println(rslt);
            ResultDao rsltDao = (ResultDao)application.getAttribute("Quizs.ResultDao");
            rsltDao.save(rslt);
            
            // connect results to student
            Student stdnt = (Student)session.getAttribute("Quizs.Student");
            stdnt.addExamResults(rslt);
            StudentDao stdDao = (StudentDao)application.getAttribute("Quizs.StudentDao");
            stdDao.merge(stdnt);
            
            // finally grade results:
            response.sendRedirect("showResult.jsp?id="+rslt.getId());
            return;
        }
    }
    
    // just make sure we did not forget an if or something
    response.sendRedirect("index.jsp");
%>