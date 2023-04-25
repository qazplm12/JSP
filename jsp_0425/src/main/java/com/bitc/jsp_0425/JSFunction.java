package com.bitc.jsp_0425;

import javax.servlet.jsp.JspWriter;

public class JSFunction {

    public static void alertLocation(String msg, String url, JspWriter out) {
        try {
            String script = "";
            script += "<script>";
            script += "alert('" + msg + "');";
            script += "location.href = '" + url + "';";
            script += "</script>";
            out.println(script);
        } catch (Exception e) {

        }
    }

    public static void alertBack(String msg, JspWriter out) {
        try {
            String script = "";
            script += "<script>";
            script += "alert('" + msg + "');";
            script += "history.back();";
            script += "</script>";
            out.println(script);
        } catch (Exception e) {

        }
    }
}
