<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%
    String senderId = request.getParameter("senderId");
    String receiverId = request.getParameter("receiverId");
    String message = request.getParameter("message");
    if ( (senderId != null) && (receiverId != null) && (message !=null) && (message.length() > 3) ) {
        Map<String, List<String>> users = (Map<String, List<String>>) application.getAttribute("Messenger");
        List<String> msgs = users.get(receiverId); 
        msgs.add(message + "; "+senderId);    
        response.sendRedirect("messengerHome.jsp?alias="+ senderId );
        return;
    }
    response.sendRedirect("messenger.jsp");
%>