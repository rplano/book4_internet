<small>    
    <a href="index.jsp">home</a> / 
<%
    if (session.getAttribute("Quizs.Student") != null) {
%>        
    <a href="exam.jsp">take exam</a> / 
    <a href="results.jsp">view results</a> / 
    <a href="../logout.jsp">logout</a>
<%
    }
    if (session.getAttribute("Quizs.Teacher") != null) {
%>        
    <a href="question.jsp">questions</a> / 
    <a href="exam.jsp">exams</a> / 
    <a href="students.jsp">students</a> / 
    <a href="../logout.jsp">logout</a>
<%
    }
%>
</small>
