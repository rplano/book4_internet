<%@page import="de.variationenzumthema.internet.login.UserDao"%>
<%
    String emailId = request.getParameter("emailId");
    String verificationToken = request.getParameter("verificationToken");
    if ((emailId != null) && (verificationToken != null)) {

        UserDao usrDao = (UserDao) application.getAttribute("Login.UserDao");
        if (usrDao.verifyUser(emailId, verificationToken)) {
            out.println("Your account is now activated!");
            out.println("Try to <a href='login.jsp'>login</a>");
            return;
        }
    }
    out.println("You must provide a valid emailId and a valid verificationToken.");
%>