<%@page import="de.variationenzumthema.internet.HibernateUtil"%>
<%@page import="de.variationenzumthema.internet.HighScore"%>
<%@page import="java.util.Collection"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Query"%>
<%
    // write score to database
    String userId = request.getParameter("userId");
    String score = request.getParameter("score");
    if ((userId != null) && (score != null)) {
        Session hibSession = HibernateUtil.getSessionFactory().openSession();
        hibSession.beginTransaction();
        HighScore hs = new HighScore(userId, Integer.parseInt(score));
        hibSession.merge(hs);
        hibSession.getTransaction().commit();
        hibSession.close();
    }

    // show high scores:
%>
<!DOCTYPE html>
<html>
    <body>
        <h1>HighScore</h1>
        <ol>
<%
    Session hibSession = HibernateUtil.getSessionFactory().openSession();

    Query q = hibSession.createQuery("from HighScore hs order by hs.score desc");
    Collection<HighScore> highScrs = q.list();

    for (HighScore hs : highScrs) {
        out.println(hs.toString()+"<br/>");
    }
    
    hibSession.close();
%>            
        </ol>
    </body>
</html>