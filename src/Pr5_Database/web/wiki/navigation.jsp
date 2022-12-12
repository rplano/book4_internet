<%
    String pageName = request.getParameter("page");
    if (pageName == null) {
        pageName = "home";
    }
%>
<small>
    <a href='index.jsp'>home</a> / 
    <a href='index.jsp?page=<%= pageName%>'>view</a> / 
    <a href='edit.jsp?page=<%= pageName%>'>edit</a> / 
    <a href='all.jsp'>all</a> / 
    <a href='search.jsp'>search</a>
</small>