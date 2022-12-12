<%@page import="java.util.Random"%>
<html>
    <body>
        <h1>NumberGuess</h1>
<%
    int numberToGuess = 0;
    if ( request.getParameter("number") == null ) {
        // we are here the first time
        Random rand = new Random();
        numberToGuess = rand.nextInt(99);
        session.setAttribute("NumberGuess", numberToGuess);
    } else {
        // we have been here before
        numberToGuess = (Integer)session.getAttribute("NumberGuess");
        int guess = Integer.parseInt( request.getParameter("number") );
        if ( numberToGuess == guess ) {
            out.println("You are the greatest!");
        } else if ( guess < numberToGuess ){
            out.println("Your guess is less than the number.");            
        } else {
            out.println("Your guess is higher than the number.");                  
        }
    }
%>
        <p>Enter your guess:</p>
        <form action="numberGuess.jsp" method="POST" >
            <input type="text" name="number" />
            <input type="submit" value="Guess" />
        </form>
    </body>
</html>