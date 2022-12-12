<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<%
    response.setContentType("image/gif");
    OutputStream os = response.getOutputStream();
    String filePath = getServletContext().getRealPath("/");
    String imagePath = filePath + "Mona_Lisa.jpg";
    InputStream is = new FileInputStream(imagePath);
    byte[] buffer = new byte[32 * 1024]; // 32k buffer
    int bytesRead = 0;
    while ((bytesRead = is.read(buffer)) != -1) {
        os.write(buffer, 0, bytesRead);
    }
    os.flush();
    os.close();
%>