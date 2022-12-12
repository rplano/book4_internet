<%
    session.setAttribute("User", "blahblah");
    response.sendRedirect("secure.jsp");
    return;
%>