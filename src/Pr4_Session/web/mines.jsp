<%@page import="de.variationenzumthema.internet.MinesClone"%>
<%
    MinesClone mc = (MinesClone)session.getAttribute("MinesClone");
    if ( mc == null ) {
        mc = new MinesClone();
        session.setAttribute("MinesClone", mc);
    }
%>
<!DOCTYPE html>
<html> 
    <body>
        <h1>Mines</h1>
        <%= mc.drawWholeField() %>
        <a href="minesLogic.jsp?reset=true">(Reset)</a>
    </body>
</html>