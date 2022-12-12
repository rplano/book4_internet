<%@page import="java.io.*"%>
<%!
    private static final String VISITOR_COUNTER_FILE_NAME = "visitorCounter2.txt";

    public void jspInit() {
        Long counter = 1L;
        if (new File(VISITOR_COUNTER_FILE_NAME).exists()) {
            try {
                DataInputStream din = new DataInputStream(
                        new FileInputStream(VISITOR_COUNTER_FILE_NAME)
                );
                counter = din.readLong();
                din.close();            
            } catch (Exception e) {}            
        } 
        ServletContext application = getServletConfig().getServletContext();
        application.setAttribute("visitorCounter2", counter);
    }
    
    public void jspDestroy() {
        ServletContext application = getServletConfig().getServletContext();
        Long counter = (Long) application.getAttribute("visitorCounter2");
        try {
            DataOutputStream dos = new DataOutputStream(
                    new FileOutputStream(VISITOR_COUNTER_FILE_NAME)
            );
            dos.writeLong(counter);
            dos.close();            
        } catch (Exception e) {}
    }
%>
<%
    Long counter = (Long) application.getAttribute("visitorCounter2");
    counter++;
    application.setAttribute("visitorCounter2", counter);
%>
<html>
    <body>
        <h2>Welcome, Visitor Nr. <%= counter%></h2>
    </body>
</html>