<%@page import="de.variationenzumthema.internet.MinesClone"%>
<%
    if ( request.getParameter("reset") != null ) {
        session.removeAttribute("MinesClone");
    } else {
        int i = Integer.parseInt( request.getParameter("i") );
        int j = Integer.parseInt( request.getParameter("j") );
        MinesClone mc = (MinesClone)session.getAttribute("MinesClone");
        mc.mouseClicked(i, j);        
    }
    response.sendRedirect("mines.jsp");
%>