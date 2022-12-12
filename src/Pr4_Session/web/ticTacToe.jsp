<%@page import="de.variationenzumthema.internet.TicTacToeLogic"%>
<%    
    // get handle to TicTacToe object
    TicTacToeLogic ttt = (TicTacToeLogic)session.getAttribute("TicTacToe");
    if ( (ttt == null) || (request.getParameter("reset") != null) ) {
        ttt = new TicTacToeLogic();
        session.setAttribute("TicTacToe", ttt);
    }
    
    // check if human made a move
    if ( request.getParameter("posI") != null ) {
        int posI = Integer.parseInt(request.getParameter("posI"));
        int posJ = Integer.parseInt(request.getParameter("posJ"));
        ttt.setNewPosition(posI,posJ);
    }
    
%>
<!DOCTYPE html>
<html>
    <body>
        <h1>TicTacToe</h1>
<table border="1">
<%
    for (int i = 0; i < 3; i++) {
        out.print("<tr>");
        for (int j = 0; j < 3; j++) {
            out.print("<td style='width:20px;text-align:center'>");
            if ( ttt.getBoardAt(i, j) == '_') {
                out.print("<a href='ticTacToe.jsp?posI="+i+"&posJ="+j+"'>");                
            }
            out.print( ttt.getBoardAt(i, j) );
            if ( ttt.getBoardAt(i, j) == '_') {
                out.print("</a>");                
            }
            out.print("</td>");
        }
        out.print("</tr>");
    }
    
    // check for game over:
    if ( ttt.isGameOver() ) {
        out.println("Game over!");
    }
%>       
</table>
    (<a href="ticTacToe.jsp?reset=true">Reset</a>)
    </body>
</html>
