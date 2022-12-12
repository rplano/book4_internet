<%
    session.removeAttribute("Chirpr.Bird");
    response.sendRedirect("index.jsp");
    return;
%>