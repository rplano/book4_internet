package de.variationenzumthema.internet;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * Stocks: Adventure
 *
 * A console program, where you walk through a house (your house) and discover
 * things
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
public class Adventure {

    private HashMap<String, ArrayList<String>> roomMap;
    private String currentRoom;

    public Adventure(String filePath) {
        loadWorld(filePath);
        currentRoom = "kitchen";
    }

    public String getCurrentRoom() {
        return currentRoom;
    }

    public boolean setCurrentRoom(String room) {
        if (roomMap.get(currentRoom).contains(room)) {
            currentRoom = room;
            return true;
        }
        return false;
    }

    public List<String> getAvailableRooms() {
        return roomMap.get(currentRoom);
    }

    private void loadWorld(String filePath) {
        roomMap = new HashMap<String, ArrayList<String>>();
        try {
            BufferedReader br = new BufferedReader(new FileReader(filePath));
            while (true) {
                String line = br.readLine();
                if (line == null) {
                    break;
                }
                String[] rooms = line.split(">");
                String from = rooms[0].trim();
                String to = rooms[1].trim();
                ArrayList<String> toRooms = roomMap.get(from);
                if (toRooms == null) {
                    toRooms = new ArrayList<String>();
                }
                toRooms.add(to);
                roomMap.put(from, toRooms);
            }
            br.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
