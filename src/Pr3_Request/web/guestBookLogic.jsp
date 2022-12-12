<%@page import="java.io.*"%>
<%
    // write comment to file:
    String text = request.getParameter("comment");
    if (text != null) {
        try {
            FileWriter fw = new FileWriter("guestBook.txt", true);
            fw.write("<li>" + text + "</li>");
            fw.close();
        } catch (Exception e) {
            // should log error to log file
        }
    }
    
    // show guest book:
%>
<!DOCTYPE html>
<html>
    <body>
        <h1>GuestBook</h1>
        <ul>
<%
    try {
        BufferedReader br = new BufferedReader(
                new FileReader("guestBook.txt") );
        while (true) {
            String line = br.readLine();
            if ( line == null ) break;
            out.println( line );
        }
        br.close();
    } catch (Exception e) {
        // should log error to log file
    }
%>            
        </ul>
    </body>
</html>