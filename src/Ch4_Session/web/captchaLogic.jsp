<%
    String sum = request.getParameter("sum");
    Integer result = (Integer) session.getAttribute("correctAnswer");
    if ( sum.equals(result.toString()) ) {
        out.println("You are most likely a human!");
    } else {
        out.println("You are a robot!");        
    }
%>