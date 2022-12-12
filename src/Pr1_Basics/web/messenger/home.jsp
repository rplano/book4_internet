<!DOCTYPE html>
<html>
    <body>
        <h1>Messenger Home</h1> 
        <p><a href='read.jsp?alias=ralph'>Read my messages.</a></p>
        <form action="home.jsp" method="GET">
            Enter message to send: <br/>
            <textarea name="message" rows="2" cols="40"></textarea>
            <input type="hidden" name="senderId" value="ralph"/>
            <br/>
            to user 
            <select name="receiverId">
                <option value='ralph'>ralph</option>
                <option value='vince'>vince</option>
            </select>                
            <input type="submit" value="Send"/>
        </form>
    </body>
</html>