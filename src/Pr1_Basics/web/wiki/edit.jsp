<!DOCTYPE html>
<html>
    <body>
<%@include file="navigation.jsp" %>

        <form action="wikiLogic.jsp" method="POST">
            <textarea name="text" rows="10" cols="50">
= Wiki =
Welcome to 'Wiki'.

Help can be found under [[help]].
----
</textarea>
            <input type="hidden" name="page" value="home"/>
            <input type="hidden" name="edit"/>
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
