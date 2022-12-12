<%@page import="java.io.StringReader"%>
<%@page import="java.io.BufferedReader"%>
<%
    String menu = "Best Pizza\n"
            + "Margherita: tomato sauce, mozzarella\n"
            + "Funghi: tomato sauce, mozzarella, mushrooms\n"
            + "Capricciosa: tomato sauce, mozzarella, mushrooms, ham,"
            + "eggs, artichoke, cocktail sausages, green olives\n"
            + "Quattro Stagioni: tomato sauce, mozzarella, ham, black "
            + "olives, mushrooms, artichoke, peas, salami, eggs\n"
            + "Vegetariana: tomato sauce, mozzarella, mushrooms, onion, "
            + "(artichoke), sweet corn, green peppers\n"
            + "Quattro Formaggi: tomato sauce, and 4 assorted cheeses, "
            + "generally mozzarella, parmesan cheese, blue cheese, and goat cheese\n";
%>    
<!DOCTYPE html>
<html>
    <body>
<%
    BufferedReader br = new BufferedReader(new StringReader(menu));
    out.println("<h1>" + br.readLine() + "</h1>");
    out.println("<ul>");

    while (true) {
        String line = br.readLine();
        if (line == null) {
            break;
        }
        String[] pizz = line.split(":");
        out.println("<li><strong>" + pizz[0] + ":</strong> " + pizz[1] + "</li>");
    }
    out.println("</ul>");
%>
    </body>
</html>