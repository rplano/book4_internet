<%@page import="java.io.FileWriter"%>
<%
    String text = request.getParameter("text");
    if (text != null) {
        try {
            FileWriter fw = new FileWriter("editor.txt");
            fw.write(text);
            fw.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    response.sendRedirect("editor.jsp");
%>