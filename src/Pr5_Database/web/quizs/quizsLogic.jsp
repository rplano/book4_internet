<%@page import="de.variationenzumthema.internet.quizs.StudentDao"%>
<%@page import="de.variationenzumthema.internet.quizs.Student"%>
<%
    // user login
    if (request.getParameter("login") != null) {
        String emailId = request.getParameter("emailId");
        if ((emailId != null) && (emailId.length() > 3)) {
            if ( emailId.equals("teacher")) {
                session.setAttribute("Quizs.Teacher","Teacher");
                response.sendRedirect("teacher/");
                return;        
                
            } else {
                // try to create a user object
                StudentDao stdntDao = (StudentDao)application.getAttribute("Quizs.StudentDao");
                Student stdnt = stdntDao.getStudent(emailId);
                if (stdnt != null) {                    
                    session.setAttribute("Quizs.Student",stdnt);
                    response.sendRedirect("student/");
                    return;        
                }
            }       
        }
        request.setAttribute("error", "Your username must be at least 4 characters long.");
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
    
    // just make sure we did not forget an if or something
    response.sendRedirect("index.jsp");
%>