<%@ page import="java.net.CookieManager" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-04
  Time: 오전 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
  Cookie cookie = new Cookie("ELCookie", "EL 좋아요");
  cookie.setPath("/");
  cookie.setMaxAge(10);
  response.addCookie(cookie);
%>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>표현 언어 - 나머지 내장 객체</title>
</head>
<body>
<div class="container my-4">
  <h3>쿠키값 읽기</h3>
  <li>ELCookie값 : ${cookie.ELCookie.value}</li>

  <h3>HTTP 헤더 읽기</h3>
  <ul>
    <li>host : ${header.host}</li>
    <li>user-agent : ${header['user-agent']}</li>
    <li>cookie : ${header.cookie}</li>
  </ul>

  <h3>컨텍스트 초기화 매개변수 읽기</h3>
<%--  <li>encoding : ${initParam.encoding}</li>--%>
  <li>MySQLDriver : ${initParam.MySQLDriver}</li>

  <h3>컨텍스트 루트 경로 읽기</h3>
  <li>${pageContext.request.contextPath}</li>
</div>
</body>
</html>
