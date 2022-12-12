<!DOCTYPE html>
<html>
    <body>
        <%@include file="../navigation.jsp" %>
        <h2>Create a New Question</h2>
        <form action="quizsLogic.jsp" method="POST">
            Question: <input type="text" name="question" size="38"/><br/>
            Answer: &nbsp; <input type='radio' name='correctAnswer' value="1"/><input type="text" name="answer1" size="34"/><br/>
            Answer: &nbsp; <input type='radio' name='correctAnswer' value="2"/><input type="text" name="answer2" size="34"/><br/>
            Answer: &nbsp; <input type='radio' name='correctAnswer' value="3"/><input type="text" name="answer3" size="34"/><br/>
            <input type="hidden" name="newQuestion"/>
            <input type="submit" value="Create Question"/>
        </form>        
    </body>
</html>
