<%@page import="de.variationenzumthema.internet.chirpr.TagDao"%>
<%@page import="de.variationenzumthema.internet.chirpr.ChirpDao"%>
<%@page import="de.variationenzumthema.internet.chirpr.BirdDao"%>
<%!    
    public void jspInit() {
        ServletContext application = getServletConfig().getServletContext();
        BirdDao brdDao = new BirdDao();
        application.setAttribute("Chirpr.BirdDao", brdDao);
        TagDao tagDao = new TagDao();
        application.setAttribute("Chirpr.TagDao", tagDao);
        ChirpDao crpDao = new ChirpDao();
        application.setAttribute("Chirpr.ChirpDao", crpDao);
        crpDao.initDatabase(brdDao,tagDao);
    }
%>
<!DOCTYPE html>
<html>
    <body>
        <h1>Chirpr</h1>
        <p>Please identify yourself:</p>
<%
    if ( request.getAttribute("error") != null ) {
        out.println("<strong>"+request.getAttribute("error")+"</strong>");
    }
%> 
        <form action="chirprLogic.jsp" method="POST">
            <p>
                <label>Email:</label>
                <input type="text" name="emailId"/>
            </p>
            <p>
                <label> </label>
                <input type="submit" value="Login"/>
            </p>
            <input type="hidden" name="login"/>
        </form>        
    </body>
</html>
