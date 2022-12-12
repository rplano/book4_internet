<%!
    private String reverseText(String s) {
        String ret = "";
        for (int i = s.length() - 1; i >= 0; i--) {
            ret += s.charAt(i);
        }
        return ret;
    }
%>
<%
    String text = request.getParameter("textToReverse");
    out.println("The reverse text is: " + reverseText(text));
%>