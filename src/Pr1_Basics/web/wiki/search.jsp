<!DOCTYPE html>
<html>
    <body>
        <%@include file="navigation.jsp" %>
        <h1>Search</h1>
        <p>Enter word to search:</p>
        <form action="index.jsp" method="POST">
            <input type="text" name="searchTerm"/>
            <input type="hidden" name="search"/>            
            <input type="submit" value="Search"/>
        </form>
    </body>
</html>