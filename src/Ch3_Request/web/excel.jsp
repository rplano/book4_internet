<%
    response.setContentType("application/vnd.ms-excel");
    for (int i = 0; i < 10; i++) {
        out.print("" + i + ",");
    }
%>