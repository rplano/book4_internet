<%@page import="java.util.logging.*"%>
<html>
    <body>
        <h1>Exceptions</h1>
<%
    try {
        int x = 5 / 0;
        
    } catch (Exception ex) {
        Logger logger = Logger.getLogger(this.getClass().getName());
        logger.severe("Exception occured: "+ex);        
    }
    out.println("Exception was caught, life is good.");
%>
    </body>
</html>