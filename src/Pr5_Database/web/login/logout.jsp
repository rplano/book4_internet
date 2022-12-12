<%
    session.removeAttribute("Login.User");
    response.sendRedirect("login.jsp");
    return;
%>