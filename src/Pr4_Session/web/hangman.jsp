<%@page import="de.variationenzumthema.internet.Hangman"%>
<%  
    // get handle to Hangman object
    Hangman hangman = (Hangman)session.getAttribute("Hangman");
    if ( (hangman == null) || (request.getParameter("reset") != null) ) {
        hangman = new Hangman();
        session.setAttribute("Hangman", hangman); 
    }
        
    // check if a guess was made
    String guess = request.getParameter("guess");
    if ( (guess != null) && (guess.length() == 1) ) {
        hangman.checkGuess(guess);
        if ( hangman.areWeDone() ) {
            out.println("Congratulations!");
        }
    }
%>
<!DOCTYPE html>
<html>
    <body>
        <h1>Hangman</h1>
        <p>The word looks like this: <strong><%= hangman.getHintWord() %></strong>.<br/>
        You used <%= hangman.getCounter() %> guesses.</p>
        <form action="hangman.jsp" method="POST" >
        Your guess: 
            <input type="text" name="guess" />
            <input type="submit" value="Guess" />
        </form>
        (<a href="hangman.jsp?reset=true">Reset</a>)
    </body>
</html>
