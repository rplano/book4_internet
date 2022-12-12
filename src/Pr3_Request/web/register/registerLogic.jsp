<%@page import="de.variationenzumthema.internet.User"%>
<%@page import="de.variationenzumthema.internet.Utility"%>
<%
    User usr = (User)Utility.extractObjectFromRequest(User.class, request);
    out.println(usr);
%>