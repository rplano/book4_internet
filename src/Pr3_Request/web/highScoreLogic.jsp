<%@page import="java.util.Collections"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.io.*"%>
<%!    
    private static final String HIGH_SCORE_FILE_NAME = "highScores2.txt";
    
    private TreeMap<Integer, String> readScoresFromFile() {
        TreeMap<Integer, String> map = null;
        
        if (!(new File(HIGH_SCORE_FILE_NAME)).exists()) {
            map = new TreeMap<Integer, String>(Collections.reverseOrder());
            
        } else {
            try {
                ObjectInputStream ois = new ObjectInputStream(
                        new FileInputStream(HIGH_SCORE_FILE_NAME));
                map = (TreeMap<Integer, String>) ois.readObject();
                ois.close();
                
            } catch (Exception e) {
                // should log error to log file
            }
        }
        
        return map;
    }
    
    private void writeScoresToFile(TreeMap<Integer, String> map) {
        try {
            ObjectOutputStream oos = new ObjectOutputStream(
                    new FileOutputStream(HIGH_SCORE_FILE_NAME));
            oos.writeObject(map);
            oos.close();
            
        } catch (Exception e) {
            // should log error to log file
        }
    }
%>
<%
    // save score to file:
    String userId = request.getParameter("userId");
    String score = request.getParameter("score");
    TreeMap<Integer, String> sortedScoreMap = readScoresFromFile();
    if ((userId != null) && (score != null)) {
        sortedScoreMap.put(Integer.parseInt(score), userId);
        writeScoresToFile(sortedScoreMap);
    }
%>
<!DOCTYPE html>
<html>
    <body>
        <h1>HighScore</h1>
        <ol>
<%    
    for (Integer scr : sortedScoreMap.keySet()) {
        out.println("<li>" +scr+": "+sortedScoreMap.get(scr) + "</li>");
    }
%>            
        </ol>
    </body>
</html>