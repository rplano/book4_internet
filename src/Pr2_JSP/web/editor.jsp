<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<!DOCTYPE html>
<html>
    <body>
        <h1>Editor</h1>
        <form action="editorLogic.jsp" method="GET">
            <textarea name="text" rows="4" cols="40">
<%
    try {
        String filePath = getServletContext().getRealPath("/") + "editor.txt";
        BufferedReader br
                = new BufferedReader(new FileReader(filePath));
        StringBuffer sb = new StringBuffer();
        while (true) {
            String line = br.readLine();
            if (line == null) {
                break;
            }
            sb.append(line);
        }
        out.println(sb);
    } catch (Exception e) {
        out.println("Type something here and save it!" + e);
    }
%></textarea>
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>