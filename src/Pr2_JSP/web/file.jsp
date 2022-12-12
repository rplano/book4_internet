<%@page import="java.util.Arrays"%>
<%@page import="java.io.File"%>
<!DOCTYPE html>
<html>
    <body>
        <h1>File</h1>
        <p>Files are dangerous.</p>
<%
    try {
        File f = new File("../../../../../../../");
        //out.println(f.getCanonicalPath() + "<br/>");
        String[] files = f.list();
        Arrays.sort(files);
        for (String fl : files) {
            out.println(fl + "<br/>");
        }

    } catch (Exception e) {
        out.println(e);
    }
%>
    </body>
</html>