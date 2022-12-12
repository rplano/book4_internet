package de.variationenzumthema.internet;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 * 
 * TicTacToeLogic
 * 
 * Contains logic for the ticTacToe.jsp page.
 * 
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
public class TicTacToeLogic {
    private static final int COMPUTER = 1;
    private static final int HUMAN = 2;

    private int[][] board;
    private int availableMoves;
    
    public TicTacToeLogic() {
        board = new int[3][3];
        availableMoves = 9;
        computerMoves();
    }

    public char getBoardAt(int i, int j) {
        char[] tmp = {'_','O','X'};        
        return tmp[ board[i][j] ];
    }
    
    public void setNewPosition(int i, int j) {
        if (isMoveAllowed(i, j)) {
            board[i][j] = HUMAN;
            availableMoves--;

            if ( !isGameOver() ) {
                computerMoves();
            }

        } else {
            //unAllowedMove();
        }
    }
    
    private void computerMoves() {
        if (availableMoves > 0) {
            int i,j;
            do {
                i = (int) (Math.random() * 3);
                j = (int) (Math.random() * 3);
            } while ( !isMoveAllowed(i, j) );
            
            board[i][j] = COMPUTER;
            availableMoves--;            
        }
    }
    
    private boolean isMoveAllowed(int i, int j) {
        if (board[i][j] == 0) {
            return true;
        }
        return false;
    }

    public boolean isGameOver() {
        if (availableMoves <= 0) {
            return true;
        }
        if (checkDiagonals()) {
            return true;
        }
        if (checkHorizontals()) {
            return true;
        }
        if (checkVerticals()) {
            return true;
        }
        return false;
    }

    private boolean checkVerticals() {
        for (int i = 0; i < 3; i++) {
            if ((board[i][0] == 1) && (board[i][1] == 1) && (board[i][2] == 1)) {
                return true;
            }
        }
        for (int i = 0; i < 3; i++) {
            if ((board[i][0] == 2) && (board[i][1] == 2) && (board[i][2] == 2)) {
                return true;
            }
        }
        return false;
    }

    private boolean checkHorizontals() {
        for (int i = 0; i < 3; i++) {
            if ((board[0][i] == 1) && (board[1][i] == 1) && (board[2][i] == 1)) {
                return true;
            }
        }
        for (int i = 0; i < 3; i++) {
            if ((board[0][i] == 2) && (board[1][i] == 2) && (board[2][i] == 2)) {
                return true;
            }
        }
        return false;
    }

    private boolean checkDiagonals() {
        if ((board[0][0] == 1) && (board[1][1] == 1) && (board[2][2] == 1)) {
            return true;
        }
        if ((board[0][0] == 2) && (board[1][1] == 2) && (board[2][2] == 2)) {
            return true;
        }
        if ((board[2][0] == 1) && (board[1][1] == 1) && (board[0][2] == 1)) {
            return true;
        }
        if ((board[2][0] == 2) && (board[1][1] == 2) && (board[0][2] == 2)) {
            return true;
        }
        return false;
    }
}
