<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Map"%>
<%
    // make sure selected alias is long enough:
    String alias = request.getParameter("alias");
    if ((alias == null) || (alias.length() < 3)) {
        response.sendRedirect("messenger.jsp");
        return;
    }

    // get map of users from application:
    Map<String, List<String>> users = (Map<String, List<String>>) application.getAttribute("Messenger");
    if (users == null) {
        users = new TreeMap<String, List<String>>();
        application.setAttribute("Messenger", users);
    }
    
    // is it a new user?
    if (!users.containsKey(alias)) {
        List<String> msgs = new ArrayList<String>();
        msgs.add("Welcome to Messenger!" + "; System");
        users.put(alias, msgs);        
    }
%>
<!DOCTYPE html>
<html>
    <body>
        <h1>Messenger Home</h1> 
        <p><a href='messengerRead.jsp?alias=<%= alias %>'>Read my messages.</a></p>
        <form action="messengerSend.jsp" method="GET">
            Enter message to send: <br/>
            <textarea name="message" rows="2" cols="40"></textarea>
            <input type="hidden" name="senderId" value="<%= alias %>"/>
            <br/>
            to user 
            <select name="receiverId">
                <%
                    for (String name : users.keySet()) {
                        out.println("<option value='" + name + "'>" + name + "</option>");
                    }
                %>
            </select>                
            <input type="submit" value="Send"/>
        </form>
    </body>
</html>