<!DOCTYPE html>
<html>
    <body>
        <h2>Simple Exam</h2>
        <form action="gradeExam.jsp" method="POST">
            <hr/>
What is 1 + 1?<br/>
<input type='radio' name='0' value='1'/>1<br/>
<input type='radio' name='0' value='2'/>2<br/>
<input type='radio' name='0' value='3'/>4<br/>
<hr/>
Which color is the sky?<br/>
<input type='radio' name='1' value='1'/>red<br/>
<input type='radio' name='1' value='2'/>black<br/>
<input type='radio' name='1' value='3'/>blue<br/>
<hr/>
            <input type="hidden" name="examName" value="Simple Exam"/>
            <input type="submit" value="Submit Answers"/>
        </form>        
    </body>
</html>