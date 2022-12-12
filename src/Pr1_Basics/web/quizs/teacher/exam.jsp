<!DOCTYPE html>
<html>
    <body>
        <%@include file="../navigation.jsp" %>
        <h2>Create a New Exam</h2>
        <form action="quizsLogic.jsp" method="POST">
            Exam name: <input type="text" name="examName" size="30"/><br/>
<input type='checkbox' name='question' value='0'/>What is 1 + 1?<br/>
<input type='checkbox' name='question' value='1'/>Which color is the sky?<br/>
            <input type="hidden" name="newExam"/>
            <input type="submit" value="Create Exam"/>
        </form>        
    </body>
</html>
