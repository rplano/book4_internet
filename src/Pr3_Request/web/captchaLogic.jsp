<%
    String sum = request.getParameter("sum");
    String result = request.getParameter("result");
    if ( sum.equals(result) ) {
        out.println("You are most likely a human!");
    } else {
        out.println("You are a robot!");        
    }
%>