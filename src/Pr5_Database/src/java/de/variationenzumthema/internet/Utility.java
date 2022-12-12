package de.variationenzumthema.internet;

import java.awt.Color;
import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.TimeZone;
import javax.servlet.http.HttpServletRequest;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * Generic: Utility
 *
 * Takes a request object and returns a POJO and fills forms from POJOs.
 *
 * NOTE: here would be a good place to do <c.out>, i.e., escape user input
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
public class Utility {

    /**
     * NOTE: there maybe problems with passwords!!!
     *
     * @param o
     * @return
     */
    public static String createJavaScriptFromObject(Object o) {
        String js = "";
        js += "<script>";
        js += "function fillFormFromJS() {";
        js += "var map = {";

        try {
            Field[] flds = o.getClass().getDeclaredFields();
            for (Field f : flds) {
                f.setAccessible(true);
                String key = f.getName();
                Object value = f.get(o);
                if (value instanceof String) {
                    //'fname': 'Ralph', 
                    js += "'" + key + "': '" + (String) value + "',";
                } else if (value instanceof Integer) {
                    js += "'" + key + "': '" + (Integer) value + "',";
                } else if (value instanceof Double) {
                    js += "'" + key + "': '" + (Double) value + "',";
                } else if (value instanceof Boolean) {
                    js += "'" + key + "': '" + (Boolean) value + "',";
                } else if (value instanceof Color) {
                    js += "'" + key + "': '" + convertColorToName((Color) value) + "',";
                } else if (value instanceof Date) {
                    //2016-08-17
                    DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                    js += "'" + key + "': '" + format.format((Date) value) + "',";
                }
            }

        } catch (Exception e) {
            System.err.println(e);
        }

        js += "};";
        js += "for(var key in map) {";
        js += "    document.getElementsByName(key)[0].value = map[key];";
        js += "}";
        js += "}";
        js += "</script>";
        return js;
    }

    /**
     * real dirty...
     *
     * @return
     */
    private static String convertColorToName(Color col) {
        String colorName = "";
        try {
            Map<Integer, String> map = new HashMap<Integer, String>();
            for (Field f : Color.class.getFields()) {
                if (f.getType() == Color.class) {
                    Color c = (Color) f.get(null);
                    map.put(c.getRGB(), f.getName());
                }
            }

            if (map.containsKey(col.getRGB())) {
                colorName = map.get(col.getRGB());
            }

        } catch (Exception e) {
            //System.err.println(e);
        }
        return colorName;
    }

    /**
     * TODO: NOTE: here would be a good place to do <c.out>, i.e., escape user
     * input
     *
     * @param c
     * @param request
     * @return
     */
    public static Object extractObjectFromRequest(Class c, HttpServletRequest request) {
        Object o = null;
        try {
            o = c.newInstance();
            Field[] flds = c.getDeclaredFields();
            for (Field f : flds) {
                String param = request.getParameter(f.getName());
                if ((param != null) && (param.length() > 0)) {
                    f.setAccessible(true);
                    Object par = null;
                    if (f.getType().getName().equals("java.lang.String")) {
                        par = param;
                    } else if (f.getType().getName().equals("java.lang.Integer")) {
                        par = Integer.parseInt(param);
                    } else if (f.getType().getName().equals("java.lang.Long")) {
                        par = Long.parseLong(param);
                    } else if (f.getType().getName().equals("java.lang.Double")) {
                        par = Double.parseDouble(param);
                    } else if (f.getType().getName().equals("java.lang.Boolean")) {
                        par = Boolean.parseBoolean(param);
                    } else if (f.getType().getName().equals("java.awt.Color")) {
                        Color color;
                        try {
                            Field field = Color.class.getField(param);
                            color = (Color) field.get(null);
                        } catch (Exception e) {
                            color = null; // Not defined
                        }
                        par = color;
                    } else if (f.getType().getName().equals("java.util.Date")) {
                        //2016-08-17
                        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                        par = format.parse(param);
                    } else if (f.getType().getName().equals("java.util.List")) {
                        try {
                            Class<?> genericListClass = (Class<?>) ((ParameterizedType) f.getGenericType()).getActualTypeArguments()[0];
                            if (genericListClass.getName().equals("java.lang.String")) {
                                par = new ArrayList<String>();
                                String[] params = request.getParameterValues(f.getName());
                                for (int i = 0; i < params.length; i++) {
                                    ((java.util.List) par).add(params[i]);
                                }
                            }
                        } catch (Exception e) {
                            System.err.println("this was unlikely to work anyway: " + e);
                            par = null;
                        }
                    } else {
                        System.err.println("Unknown type: " + f.getType().getName());
                    }

                    if (par != null) {
                        f.set(o, par);
                    }
                }
            }

        } catch (Exception e) {
            System.err.println(e);
        }
        return o;
    }

    /**
     * not very efficient but does the job
     *
     * @param s
     * @return
     */
    public static boolean isLong(String s) {
        try {
            Long.parseLong(s);
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    /**
     * not very efficient but does the job
     *
     * @param s
     * @return
     */
    public static boolean isInteger(String s) {
        try {
            Integer.parseInt(s);
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    /**
     * Not the fastest... but works. Checks for XML problematic characters:
     * "&'<>
     */
    public static String escapeXml(String in) {
        in = in.replace("&", "&amp;");
        in = in.replace("\"", "&#034");
        in = in.replace("'", "&#039");
        in = in.replace("<", "&lt;");
        in = in.replace(">", "&gt;");
        return in;
    }

    /**
     * Not the fastest... but works. Checks for SQL problematic characters: '%_
     */
    public static String escapeSql(String in) {
        in = in.replace("%", "&#037");
        in = in.replace("'", "&#039");
        in = in.replace("_", "&#095");
        return in;
    }

    public static void main(String[] args) throws ParseException {
        String t1 = "hi ' there _+_ __ % like %%";
        System.out.println(escapeSql(t1));
        String t2 = "\"\" let's use <some> funny & not && so funny tag's";
        System.out.println(escapeXml(t2));

//        // from 19991227 to 27-Dec-99
//        // 31-Dec-05	
//        DateFormat formater1 = new SimpleDateFormat("yyyyMMdd");
//        DateFormat formater2 = new SimpleDateFormat("dd-MMM-yy");
//        Date dte = (Date) formater1.parse("20041230");
//        System.out.println(formater2.format(dte));

    }
}
