<%@page import="java.io.*"%>
<%
    // write comment to file:
    String text = request.getParameter("menu");
    if (text != null) {
        BufferedReader br = new BufferedReader( new StringReader(text) );
        try {
            String path = request.getServletContext().getRealPath("/");
            FileWriter fw = new FileWriter(path+"pizzaMenu.html");
            fw.write("<!DOCTYPE html><html><body>");
            fw.write("<h1>" + br.readLine() + "</h1>");
            fw.write("<ul>");
            
            while (true) {
                String line = br.readLine();
                if (line == null) break;
                String[] pizz = line.split(":");
                fw.write("<li><strong>" + pizz[0] +":</strong> "+ pizz[1] + "</li>");            
            }
            
            fw.write("</ul>");
            fw.write("</body></html>");
            fw.close();
        } catch (Exception e) {
            // should log error to log file
        }
    }
    
    response.sendRedirect("pizzaMenu.html");
%>         
