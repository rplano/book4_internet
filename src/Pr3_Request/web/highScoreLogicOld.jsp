<%@page import="java.util.Collections"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.io.*"%>
<%!
    private static final String HIGH_SCORE_FILE_NAME = "highScores.txt";
    
    private TreeMap<Integer,String> readScoresFromFile() {
        TreeMap<Integer,String> map = 
                new TreeMap<Integer,String>(Collections.reverseOrder());
        try {
            BufferedReader br = new BufferedReader(
                    new FileReader(HIGH_SCORE_FILE_NAME));
            while (true) {
                String scoreLine = br.readLine();
                if (scoreLine == null) break;
                StringTokenizer st = new StringTokenizer(scoreLine, ":");
                String score = st.nextToken().trim();
                String userId = st.nextToken().trim();
                map.put(Integer.parseInt(score), userId);
            }
            br.close();
        } catch (Exception e) {
            // should log error to log file
        }
        return map;
    }
    
    private void writeScoresToFile(TreeMap<Integer,String> map) {
        try {
            FileWriter fw = new FileWriter(HIGH_SCORE_FILE_NAME);            
            for (int score : map.keySet()) {
                fw.write(""+score+":"+map.get(score) +"\n");
            }
            fw.close();        
        } catch (Exception e) {
            // should log error to log file
        }
    }
%>
<%
    // write score to file:
    String userId = request.getParameter("userId");
    String score = request.getParameter("score");
    if ((userId != null) && (score != null)) {
        TreeMap<Integer,String> sortedScoreMap = readScoresFromFile();
        sortedScoreMap.put(Integer.parseInt(score), userId);
        writeScoresToFile(sortedScoreMap);
    }
    
    // show high scores:
%>
<!DOCTYPE html>
<html>
    <body>
        <h1>HighScore</h1>
        <ol>
<%
    try {
        BufferedReader br = new BufferedReader(
                new FileReader(HIGH_SCORE_FILE_NAME) );
        while (true) {
            String line = br.readLine();
            if ( line == null ) break;
            out.println("<li>" + line + "</li>");
        }
        br.close();
    } catch (Exception e) {
        // should log error to log file
    }
%>            
        </ol>
    </body>
</html>