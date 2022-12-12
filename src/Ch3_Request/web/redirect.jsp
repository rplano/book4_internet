<%
    String redirect = request.getParameter("redirect");
    if ( (redirect != null) && (redirect.equalsIgnoreCase("true")) ) {
        response.sendRedirect("index.jsp");
        return; // this is very important!
    } else {
        out.println("Hi there!");
    }
%>