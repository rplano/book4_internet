<%
    session.removeAttribute("User");
    response.sendRedirect("login.jsp");
    return;
%>