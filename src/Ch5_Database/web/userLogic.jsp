<%@page import="de.variationenzumthema.internet.User"%>
<%@page import="de.variationenzumthema.internet.HibernateUtil"%>
<%@page import="java.util.Collection"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Query"%>
<%    
    // write user to database
    String lastName = request.getParameter("lastName");
    String firstName = request.getParameter("firstName");
    String email = request.getParameter("email");
    if (lastName != null) { 
        Session hibSession = HibernateUtil.getSessionFactory().openSession();
        hibSession.beginTransaction();
        User usr = new User(lastName,firstName,email);
        hibSession.merge(usr);
        hibSession.getTransaction().commit();
        hibSession.close();
    }

    // show all users:
%>
<!DOCTYPE html>
<html>
    <body>
        <h1>All Users</h1>
        <ol>
<%
    Session hibSession = HibernateUtil.getSessionFactory().openSession();

    Query q = hibSession.createQuery("from User usr order by usr.lastName desc");
    Collection<User> allUsrs = q.list();

    for (User usr : allUsrs) {
        out.println(usr.toString()+"<br/>");
    }
    
    hibSession.close();
%>            
        </ol>
    </body>
</html>