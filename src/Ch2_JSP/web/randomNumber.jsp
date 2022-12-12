<%!
    private int nextInt(int max) {
        return (int) (Math.random() * max);
    }
%>
<%
    out.println(nextInt(6) + 1);
%>