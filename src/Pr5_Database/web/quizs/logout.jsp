<%
    session.removeAttribute("Quizs.Student");
    session.removeAttribute("Quizs.Teacher");
    response.sendRedirect("index.jsp");
    return;
%>