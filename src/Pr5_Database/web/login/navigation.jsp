<%@page import="de.variationenzumthema.internet.login.User"%>
<small>    
    <a href="index.jsp">home</a> / 
<%
    if ( session.getAttribute("Login.User") == null ) {
        out.println("<a href='login.jsp'>login</a> / ");
        out.println("<a href='register.jsp'>register</a> / ");
    } else {
        out.println("<a href='logout.jsp'>logout</a> / ");     
        out.println("<a href='changePassword.jsp'>changePassword</a> / ");        
    }
%>    
    <a href="protected.jsp">protected</a> / 
    <a href="terms.jsp">terms</a>
</small>
