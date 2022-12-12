package de.variationenzumthema.internet;

import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * TwoPlayer
 *
 * Contains logic to find a partner and send simple messages.<br/>
 * The following can happen: <br/>
 * - I am first, hence I need to wait and be notified <br/>
 * - I am second, can start immediately, unless first guy has left <br/>
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
public class TwoPlayerLogic {

    private String waitingId = null;
    private Map<String, String> pairMap;
    private Map<String, Vector<String>> messageMap;

    public TwoPlayerLogic() {
        pairMap = new HashMap<String, String>();
        messageMap = new HashMap<String, Vector<String>>();
    }

    public void sendMessage(String pairId, String msg) {
        Vector<String> msgs = messageMap.get(pairId);
        if (msgs != null) {
            msgs.add(msg);
        }
    }

    public Vector<String> receiveMessages(String pairId) {
        Vector<String> msgs = messageMap.get(pairId);
//        if ( msgs == null ) {
//            msgs = new Vector<String>();
//            messageMap.put(pairId,msgs);
//        }
        return msgs;
    }

    /**
     * Find a partner, if partner is waiting, it will return the pairId. If not,
     * it will store mySessionId in this.waitingId. pairId is just the sum of
     * mySessionId and waitingId. Usage: findPartner( session.getId() );
     *
     * @param mySessionId is a sessionId
     * @return null if I am first and pairId if I am second
     */
    public String findPartner(String mySessionId) {
        // check if I am paired already:
        String pairId = pairMap.get(mySessionId);
        if (pairId == null) {
            if ((waitingId != null) && (waitingId != mySessionId)) {
                // somebody is already waiting:
                pairId = waitingId + mySessionId;
                pairMap.put(waitingId, pairId);
                pairMap.put(mySessionId, pairId);
                waitingId = null;

                // add a first welcome message
                Vector<String> msgs = new Vector<String>();
                msgs.add("Welcome!");
                messageMap.put(pairId, msgs);

            } else {
                // nobody is waiting:
                pairId = null;
                waitingId = mySessionId;
            }
        }
        return pairId;
    }

    /**
     * When removing an id from the pairMap, we need to remove both.
     *
     * @param mySessionId
     */
    public void removeFromPairMap(String pairId) {
        // check if I am paired already:
        //String pairId = pairMap.get(mySessionId);
        if (pairId != null) {
            int len = pairId.length() / 2;
            String id1 = pairId.substring(0, len);
            String id2 = pairId.substring(len);
            pairMap.remove(id1);
            pairMap.remove(id2);
            messageMap.remove(pairId);
        }
    }

    public static void main(String[] args) {
        String pairId = "123456";
        int len = pairId.length() / 2;
        String id1 = pairId.substring(0, len);
        String id2 = pairId.substring(len);
        System.out.println(id1);
        System.out.println(id2);
    }
}
