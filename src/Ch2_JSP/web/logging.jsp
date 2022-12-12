<%@page import="java.util.logging.*"%>
<html>
    <body>
        <h1>Logging</h1>
<%
    // one way to log to the servers log files is via
    System.out.println("First log message.");
    
    // another more professional way is via
    Logger logger = Logger.getLogger(this.getClass().getName());
    logger.severe("Second log message.");
%>
    </body>
</html>