<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-25
  Time: 오전 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.bitc.jsp_0425.CookieManager" %>
<%@ page import="com.bitc.jsp_0425.JSFunction" %>

<%
    // 클라이언트에서 userid, userpw, savCheck 값을 가져옴
    String user_id = request.getParameter("user_id");
    String user_pw = request.getParameter("user_pw");
    String save_check = request.getParameter("save_check");

    // 사용자 정보와 클라이언트에서 전송된 정보가 같으면
    if ("must".equals(user_id) && "1234".equals(user_pw)) {
        // 클라이언트에서 전송된 정보 중 saveCheck 값이 "Y" 이면
        if (save_check != null && save_check.equals("Y")) {
            // 쿠키 생성
            CookieManager.makeCookie(response, "loginId", user_id, 86400);
        } else {
            CookieManager.deleteCookie(response, "loginId");
        }

        JSFunction.alertLocation("로그인에 성공했습니다.", "IdSaveMain.jsp", out);
    } else {
        JSFunction.alertBack("로그인에 실패했습니다.", out);
    }
%>