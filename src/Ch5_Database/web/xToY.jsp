<%@page import="de.variationenzumthema.internet.user.User1"%>
<%@page import="de.variationenzumthema.internet.user.User2"%>
<%@page import="de.variationenzumthema.internet.user.User3"%>
<%@page import="de.variationenzumthema.internet.user.User4"%>
<%@page import="de.variationenzumthema.internet.user.User5"%>
<%@page import="de.variationenzumthema.internet.user.Email"%>
<%@page import="de.variationenzumthema.internet.user.Email5"%>
<%@page import="de.variationenzumthema.internet.HibernateUtil"%>
<%@page import="java.util.Collection"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Query"%>
<!DOCTYPE html>
<html>
    <body>
        <h1>X to Y uni-directional</h1>
<%
    // write user to database
    Session hibSession = HibernateUtil.getSessionFactory().openSession();
    try {
        hibSession.beginTransaction();

        // one-to-one
        Email eml = new Email("ralph@lano.de");
        hibSession.merge(eml);
        User1 usr1 = new User1("ralph");
        usr1.addEmail(eml);
        hibSession.merge(usr1);
        // not allowed:
//        User1 usr2 = new User1("vince");
//        usr2.addEmail(eml);
//        hibSession.merge(usr2);

//        // one-to-many
//        Email eml1 = new Email("ralph1@lano.de");
//        hibSession.merge(eml1);
//        Email eml2 = new Email("ralph2@lano.de");
//        hibSession.merge(eml2);
//        User2 usr1 = new User2("ralph");
//        usr1.addEmail(eml1);
//        usr1.addEmail(eml2);
//        hibSession.merge(usr1);
//        // not allowed:
////        User2 usr2 = new User2("vince");
////        usr2.addEmail(eml1);
////        hibSession.merge(usr2);
                
//        // many-to-many
//        Email eml1 = new Email("ralph1@lano.de");
//        hibSession.merge(eml1);
//        Email eml2 = new Email("ralph2@lano.de");
//        hibSession.merge(eml2);
//        User4 usr1 = new User4("ralph");
//        usr1.addEmail(eml1);
//        usr1.addEmail(eml2);
//        hibSession.merge(usr1);
//        User4 usr2 = new User4("vince");
//        usr2.addEmail(eml1);
//        hibSession.merge(usr2);
    
//        // many-to-one uni-directional
//        Email eml1 = new Email("ralph1@lano.de");
//        hibSession.merge(eml1);
//        User3 usr1 = new User3("ralph");
//        usr1.addEmail(eml1);
//        hibSession.merge(usr1);
//        User3 usr2 = new User3("vince");
//        usr2.addEmail(eml1);
//        hibSession.merge(usr2);
        
//        // many-to-one bi-directional
//        Email5 eml1 = new Email5("ralph1@lano.de");
//        Email5 eml2 = new Email5("ralph2@lano.de");
//        hibSession.merge(eml1);
//        hibSession.merge(eml2);
//        User5 usr1 = new User5("ralph");
//        usr1.addEmail(eml1);
//        eml1.addUser(usr1);
//        hibSession.merge(usr1);
//        User5 usr2 = new User5("vince");
//        usr2.addEmail(eml1);
//        eml1.addUser(usr2);
//        hibSession.merge(usr2);
//        hibSession.merge(eml1);
//        hibSession.merge(eml2);
        
        hibSession.getTransaction().commit();
    } catch (Exception e) {
        out.println(e);
        hibSession.getTransaction().rollback();
    }
    hibSession.close();
%>         
    </body>
</html>