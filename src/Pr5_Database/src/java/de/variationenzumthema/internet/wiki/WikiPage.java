package de.variationenzumthema.internet.wiki;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.StringReader;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * Wiki: WikiPage
 *
 * A dish has a name, a price and a list of ingredients.
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
@Entity
@Table(name = "WikiPage")
public class WikiPage {

    @Id
    private String pageId;

    @Column(length = 32000, nullable = false)
    private String content;

    @Column(nullable = false)
    private Date date;

    // author
    /**
     * Hibernate needs a default constructor.
     */
    public WikiPage() {
        super();
    }

    public WikiPage(String pageId, String content) {
        this.pageId = pageId;
        this.content = content;
        this.date = new Date();
    }

    public String getPageId() {
        return pageId;
    }

    public String getContent() {
        return content;
    }

    public String getHTML() {
        String html = "";
        try {
            BufferedReader br = new BufferedReader(new StringReader(content));
            while (true) {
                String line;
                line = br.readLine();
                if (line == null) {
                    break;
                }
                html += parseLine(line);
            }
            br.close();
        } catch (IOException ex) {
            Logger.getLogger(WikiPage.class.getName()).log(Level.SEVERE, null, ex);
        }
        return html;
    }
    
    private String parseLine(String line) {
        String regex;
        
        // ' ' <br/>
        if (line.length() == 0) {
            line = "<br/>\n";
            return line;
        }
        
        // ---- <hr/>
        if (line.equals("----")) {
            line = "<hr/>\n";
            return line;
        }
        
        // escape html tags: '<' and '>'
        line = line.replaceAll("<", "&lt;");
        line = line.replaceAll(">", "&gt;");
       
        // * <ul><li>
        if (line.startsWith("*")) {
            line = "<ul><li>" + line.substring(1) + "</li></ul>\n";
        }
        
        // = <h1>
        if (line.startsWith("=")) {
            regex = "(=(.+?)=)"; 
            line = line.replaceAll(regex, "<h1>$2</h1>\n");

            // == <h2>
            regex = "(==(.+?)==)"; 
            line = line.replaceAll(regex, "<h2>$2</h2>\n");

            // === <h3>
            regex = "(===(.+?)===)"; 
            line = line.replaceAll(regex, "<h3>$2</h3>\n");
        }
        
        // [[]] <a>
        regex = "(\\[\\[(.+?)\\]\\]*)"; 
        line = line.replaceAll(regex, "<a href='index.jsp?page=$2'>$2</a>");

        // \[ -> [
        line = line.replaceAll("\\\\\\[", "[");
        line = line.replaceAll("\\\\\\]", "]");

        return line;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDate() {
        return date;
    }

    @Override
    public String toString() {
        return "WikiPage{" + "pageId=" + pageId + ", content=" + content + ", date=" + date + '}';
    }
}
