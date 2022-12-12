package de.variationenzumthema.internet;

import java.util.Random;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * Asteroids: MinesClone
 *
 * MinesClone: randomly distribute 10 mines over an 8x8 playing field. Use
 * checkForMinesAt(x,y) to check for mines. It returns a char with the digit '
 * ', '1', ... or 'M'. Start a timer at the beginning of the game. <br/>
 * Challenge: play the real game of mines, you will notice when you click on an
 * empty field the surrounding tiles will be uncovered.
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
public class MinesClone implements MinesConstant {

    /**
     * Playing field is represented by an 8x8 array of chars
     */
    private char[][] field = new char[FIELD_SIZE][FIELD_SIZE];
    private char[][] visible = new char[FIELD_SIZE][FIELD_SIZE];

    public MinesClone() {
        initialzeField();
        countMines();
    }

    /**
     * This method goes through all tiles of a given field and counts the mines
     * surrounding the given tile. If the tile is a mine, no counting needs to
     * be done. <br>
     * Pre-condition: the field f has only the chars 'M' and ' ' (space) in it.
     * <br>
     * Post-condition: the field f now has the chars 'M' (mine) or ' ' (no mines
     * neighboring), '1' (one mine neighboring), '2' (two mines neighboring),
     * etc.
     */
    public void countMines() {
        for (int i = 0; i < FIELD_SIZE; i++) {
            for (int j = 0; j < FIELD_SIZE; j++) {
                if (field[i][j] != 'M') {
                    int nrOfMines = countMinesSurroundingTile(i, j);
                    field[i][j] = (char) ('0' + nrOfMines);
                }
            }
        }
    }

    /**
     * Counts the mines surrounding a given tile.
     *
     * @param x the x position of the tile.
     * @param y the y position of the tile.
     * @return the number of mines surrounding the given tile.
     */
    private int countMinesSurroundingTile(int x, int y) {
        int nrOfMines = 0;
        for (int i = -1; i <= 1; i++) {
            for (int j = -1; j <= 1; j++) {
                if ((x + i >= 0) && (x + i < FIELD_SIZE)) {
                    if ((y + j >= 0) && (y + j < FIELD_SIZE)) {
                        if (field[x + i][y + j] == 'M') {
                            nrOfMines++;
                        }
                    }
                }
            }
        }
        return nrOfMines;
    }

    /**
     * Initialize the whole field with NUMBER_OF_MINES being randomly
     * distributed.
     */
    private void initialzeField() {
        Random rgen = new Random();
        for (int i = 0; i < NUMBER_OF_MINES; i++) {
            int x = rgen.nextInt(FIELD_SIZE);
            int y = rgen.nextInt(FIELD_SIZE);
            field[x][y] = 'M';
        }
    }

    /**
     * Draws at the position i,j an image of a mine ("mine.png"), if there is
     * one or the empty field image ("empty.png") overlayed with a GLabel
     * displaying the number of neighboring mines.
     */
    private String drawOneTile(int i, int j) {
        String imgName = "images/empty.png";
        String lbl = "&nbsp;";
        switch (visible[i][j]) {
            case 'M':
                imgName = "images/mine.png";
                break;
            case 'E':
                imgName = "images/exploded.png";
                break;
            case '0':
            case '1':
            case '2':
            case '3':
            case '4':
            case '5':
            case '6':
            case '7':
            case '8':
                imgName = "images/empty.png";
                lbl = "" + visible[i][j];
                break;
            default:
                imgName = "images/initial.png";
        }
        String html = "<td style='text-align:center;background-image:url(" + imgName + ");background-repeat:no-repeat;background-size:50px 50px;   width: 50px; height: 50px;'>";
        html += "<a href='minesLogic.jsp?i=" + i + "&j=" + j + "'>" + lbl + "</a>";
        html += "</td>";
        return html;
    }

    /**
     * Draws the initial field, with all fields showing the "initial.png" image.
     */
    public String drawWholeField() {
        String html = "<table style='border-spacing: 0;border-collapse: collapse;'>";
        for (int i = 0; i < FIELD_SIZE; i++) {
            html += "<tr>";
            for (int j = 0; j < FIELD_SIZE; j++) {
                html += drawOneTile(i, j);
            }
            html += "</tr>";
        }
        html += "</table>";
        return html;
    }

    public void mouseClicked(int x, int y) {
        if (field[x][y] == 'M') {
            field[x][y] = 'E';
            discoverAll();
        } else if (field[x][y] == '0') {
            visible[x][y] = field[x][y];
            discoverEmtpyTiles(x, y);
        } else {
            visible[x][y] = field[x][y];
        }
    }

    private void discoverEmtpyTiles(int x, int y) {
        for (int i = -1; i <= 1; i++) {
            for (int j = -1; j <= 1; j++) {
                if ((x + i >= 0) && (x + i < FIELD_SIZE)) {
                    if ((y + j >= 0) && (y + j < FIELD_SIZE)) {
                        visible[x + i][y + j] = field[x + i][y + j];
                        //if (field[x + i][y + j] == '0') {
                        //    if ( (i!=0) && (j!=0) ) {
                        //     discoverEmtpyTiles(x,y);
                        //    }
                        //}
                    }
                }
            }
        }
    }

    private void discoverAll() {
        for (int i = 0; i < FIELD_SIZE; i++) {
            for (int j = 0; j < FIELD_SIZE; j++) {
                visible[i][j] = field[i][j];
            }
        }
    }

}
