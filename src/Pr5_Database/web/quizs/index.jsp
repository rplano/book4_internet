<%@page import="de.variationenzumthema.internet.quizs.ResultDao"%>
<%@page import="de.variationenzumthema.internet.quizs.ExamDao"%>
<%@page import="de.variationenzumthema.internet.quizs.QuestionDao"%>
<%@page import="de.variationenzumthema.internet.quizs.StudentDao"%>
<%!
    public void jspInit() {
        ServletContext application = getServletConfig().getServletContext();

        StudentDao stdntDao = new StudentDao();
        stdntDao.initDatabase();
        application.setAttribute("Quizs.StudentDao", stdntDao);

        QuestionDao qstnDao = new QuestionDao();
        application.setAttribute("Quizs.QuestionDao", qstnDao);
        
        ExamDao exmDao = new ExamDao();
        exmDao.initDatabase(qstnDao);
        application.setAttribute("Quizs.ExamDao", exmDao);
        
        ResultDao rsltDao = new ResultDao();
        application.setAttribute("Quizs.ResultDao", rsltDao);
    }
%>
<!DOCTYPE html>
<html>
    <body>
        <h1>Quizs</h1>
        <p>Please identify yourself:</p>
        <%
            if (request.getAttribute("error") != null) {
                out.println("<strong>" + request.getAttribute("error") + "</strong>");
            }
        %> 
        <form action="quizsLogic.jsp" method="POST">
            <p>
                <label>Email:</label>
                <input type="text" name="emailId"/>
            </p>
            <p>
                <label> </label>
                <input type="submit" value="Login"/>
            </p>
            <input type="hidden" name="login"/>
        </form>        
    </body>
</html>
