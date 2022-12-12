<%@page import="de.variationenzumthema.internet.chirpr.TagDao"%>
<%@page import="de.variationenzumthema.internet.chirpr.ChirpDao"%>
<%@page import="de.variationenzumthema.internet.chirpr.Chirp"%>
<%@page import="de.variationenzumthema.internet.chirpr.Bird"%>
<%@page import="de.variationenzumthema.internet.chirpr.BirdDao"%>
<%
    // user login
    if (request.getParameter("login") != null) {
        String emailId = request.getParameter("emailId");
        if ((emailId != null) && (emailId.length() > 3)) {
            // try to create a user object
            BirdDao brdDao = (BirdDao)application.getAttribute("Chirpr.BirdDao");
            Bird brd = brdDao.getBird(emailId);
            
            if (brd != null) {
                session.setAttribute("Chirpr.Bird",brd);
                response.sendRedirect("protected.jsp");
                return;                               
            }
        }
        request.setAttribute("error", "Your username must be at least 4 characters long.");
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
    
    // chirp
    if (request.getParameter("chirp") != null) {
        Bird brd = (Bird)session.getAttribute("Chirpr.Bird");
        if ( brd != null) {
            String text = request.getParameter("text");
            if ((text != null) && (text.length() >= 5) && (text.length() <= 42)) {
                Chirp crp = new Chirp(text);
                ChirpDao crpDao = (ChirpDao) application.getAttribute("Chirpr.ChirpDao");
                crpDao.save(crp);
                brd.addChirp(crp);                
                BirdDao brdDao = (BirdDao)application.getAttribute("Chirpr.BirdDao");
                brdDao.merge(brd);
                TagDao tagDao = (TagDao)application.getAttribute("Chirpr.TagDao");
                tagDao.parseChirpForTags(crp);
            }            
        }
        response.sendRedirect("protected.jsp");
        return;       
    }
    
    // just make sure we did not forget an if or something
    response.sendRedirect("index.jsp");
%>