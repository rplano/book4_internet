<%@page import="de.variationenzumthema.internet.login.Utility"%>
<%@page import="de.variationenzumthema.internet.login.UserDao"%>
<%@page import="de.variationenzumthema.internet.login.User"%>
<%
    // user login
    if (request.getParameter("login") != null) {
        String emailId = request.getParameter("emailId");
        String passwd = request.getParameter("password");
        if ((emailId != null) && (passwd != null)) {
            // try to create a user object
            UserDao usrDao = (UserDao)application.getAttribute("Login.UserDao");
            User usr = usrDao.loginUser(emailId,passwd);

            if ( usr != null ) {
                session.setAttribute("Login.User",usr);
                response.sendRedirect("protected.jsp");
                return;               
            } else {
                request.setAttribute("error", "Wrong username and/or password.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }
        }
        request.setAttribute("error", "Please enter username and password.");
        request.getRequestDispatcher("login.jsp").forward(request, response);
        return;
    }
    
    // registration
    if (request.getParameter("registration") != null) {
        
        UserDao usrDao = (UserDao)application.getAttribute("Login.UserDao");
        String errorMsg = usrDao.verifyRegistrationData(request);
        if ( errorMsg == null ) {
            String email = usrDao.createUser(request);
            out.println("Registration success!");
            out.println(email);
            return; 
           
        } else {
            request.setAttribute("error", errorMsg);
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;                      
        }
    }
    
    // forgot password
    if (request.getParameter("forgotPassword") != null) {
        String emailId = request.getParameter("emailId");
        String favoriteColor = request.getParameter("favoriteColor");
        if ((emailId != null) && (favoriteColor != null)) {
            UserDao usrDao = (UserDao)application.getAttribute("Login.UserDao");
            String email = usrDao.forgotPassword(emailId,favoriteColor);
            if ( email == null ) {
                request.setAttribute("error", "The information you provided do not match any of our records.");
                request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
                return;                
            } else {
                out.println("The following email was sent to you: ");
                out.println(email);
                out.println("You should change your password at your next login!");
                return;   
            }
        }
    }
    
    // change password
    if (request.getParameter("changePassword") != null) {
        UserDao usrDao = (UserDao)application.getAttribute("Login.UserDao");
        User usr = (User)session.getAttribute("Login.User");
        String errorMsg = usrDao.changePassword(request,usr);
        if ( errorMsg == null ) {
            out.println("Change of password success!");
            return; 
           
        } else {
            request.setAttribute("error", errorMsg);
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            return;                      
        }

    }
    
    // just make sure we did not forget an if or something
    response.sendRedirect("login.jsp");
%>