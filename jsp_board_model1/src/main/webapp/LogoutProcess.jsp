<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-03
  Time: 오후 12:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    // 세션 정보 삭제
    session.removeAttribute("userId");
    session.removeAttribute("userName");

    session.invalidate();

    String msg = "<script>";
    msg += "alert('로그아웃 되었습니다.');";
    msg += "location.href='/Login.jsp';";
    msg += "</script>";

    out.println(msg);

//    response.sendRedirect("Login.jsp");
%>