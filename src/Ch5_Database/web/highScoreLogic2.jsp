<%@page import="de.variationenzumthema.internet.HibernateUtil"%>
<%@page import="de.variationenzumthema.internet.HighScoreDao"%>
<%@page import="de.variationenzumthema.internet.HighScore"%>
<%@page import="java.util.Collection"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Query"%>
<%
    // write score to database
    HighScoreDao dao = new HighScoreDao();
    String userId = request.getParameter("userId");
    String score = request.getParameter("score");
    if ((userId != null) && (score != null)) {
        HighScore hs = new HighScore(userId, Integer.parseInt(score));
        dao.merge(hs);
    }

    // show high scores:
%>
<!DOCTYPE html>
<html>
    <body>
        <h1>HighScore</h1>
        <ol>
<%
    Collection<HighScore> highScrs = dao.findAll();

    for (HighScore hs : highScrs) {
        out.println(hs.toString()+"<br/>");
    }
%>            
        </ol>
    </body>
</html>