<%
    String id = request.getParameter("userId");
    String passwd = request.getParameter("password");
    if ((id != null) && (passwd != null)) {
        if ((id.equals("ralph")) && (passwd.equals("123456"))) {
            out.println("Welcome!");
        } else {
            out.println("Please, try again!");
        }
    }
%>