<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%!
    public void jspInit() {
        // init dictionary:
        String sPath = getServletContext().getRealPath("/") + "dictionary_en_de.txt";
        Map<String,String> dictionary = loadDictionaryFromFile(sPath);
        ServletContext application = getServletConfig().getServletContext();
        application.setAttribute("Dictionary", dictionary);
    }

    /**
     * This method should load the dictionary from file and store it in a Map
     *
     * @param fileName
     */
    private Map<String,String> loadDictionaryFromFile(String fileName) {
        Map<String,String> dictionary = new HashMap<String,String>();
        try {
            BufferedReader br = new BufferedReader(new FileReader(fileName));
            while (true) {
                String words = br.readLine();
                if (words == null) {
                    break;
                }
                StringTokenizer st = new StringTokenizer(words, "=");
                String en = st.nextToken().trim();
                String de = st.nextToken().trim();
                //System.out.println(en + ": " + de);

                dictionary.put(en, de);
            }

            br.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dictionary;
    }
%>
<%
    // do the translation:
    Map<String,String> dictionary = 
            (Map<String,String>)application.getAttribute("Dictionary");
        
    String english = request.getParameter("englishWord");
    String german = dictionary.get(english);
    out.println("The German translation of '" + english + "' is '" + german + "'");
%>