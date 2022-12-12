<%@page import="java.util.Locale"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   String userLocale = request.getHeader("Accept-Language");
   //out.println(userLocale);
   Locale locale = request.getLocale();
   String userlanguage = locale.getDisplayLanguage();
   //out.println("LANG :" + locale.getLanguage());
   
   if ( "de".equals(locale.getLanguage())) {
       response.sendRedirect("de/");
       return;
   } 
    response.sendRedirect("en/");
    return;   
  %>