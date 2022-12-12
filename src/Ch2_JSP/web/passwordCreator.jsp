<%@page import="de.variationenzumthema.internet.PasswordCreator"%>
<%
    out.println(PasswordCreator.generatePassword());
%>