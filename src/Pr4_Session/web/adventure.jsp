<%@page import="de.variationenzumthema.internet.Adventure"%>
<%
    Adventure advntr = (Adventure) session.getAttribute("Adventure");
    if (advntr == null) {
        String filePath = config.getServletContext().getRealPath("/") + "adventure.txt";
        advntr = new Adventure(filePath);
        session.setAttribute("Adventure", advntr);
    }
%>
<!DOCTYPE html>
<html> 
    <body>
        <h1>Adventure</h1>
        <p>You are currently in '<%= advntr.getCurrentRoom()%>'.</p>
        <form action="adventureLogic.jsp" method="POST" >
            You can go to: 
            <select name="room">
                <%
                    for (String room : advntr.getAvailableRooms()) {
                        out.println("<option value='" + room + "'>" + room + "</option>");
                    }
                %>
            </select>
            <input type="submit" value="Go" />
        </form>
        <br/>
        <a href="adventureLogic.jsp?reset=true">(Reset)</a>
    </body>
</html>