<%
    String id = request.getParameter("userId");
    String passwd = request.getParameter("password");
    if ((id != null) && (passwd != null)) {
        if ((id.equals("ralph")) && (passwd.equals("123456"))) {
            session.setAttribute("User", id);
            response.sendRedirect("protected.jsp");
            return;
        }
    }
    session.removeAttribute("User");
    response.sendRedirect("login.jsp");
    return;
%>