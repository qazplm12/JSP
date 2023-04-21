<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-21
  Time: 오후 3:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>내장 객체 - request</title>
</head>
<body>
<div class="container">
  <h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
  <ul>
    <%
      request.setCharacterEncoding("UTF-8");
    %>
    <li>데이터 전송 방식 : <%= request.getMethod() %></li>
    <li>URL : <%= request.getRequestURL() %></li>
    <li>URI : <%= request.getRequestURI() %></li>
    <li>프로토콜 : <%= request.getProtocol() %></li>
    <li>서버명 : <%= request.getServerName() %></li>
    <li>서버 포트 : <%= request.getServerPort() %></li>
    <li>클라이언트 IP 주소 : <%= request.getRemoteAddr() %></li>
    <li>쿼리스트링 : <%= request.getQueryString() %></li>
    <li>전송된 값 1 : <%= request.getParameter("eng") %></li>
    <li>전송된 값 2 : <%= request.getParameter("han") %></li>
  </ul>
</div>
</body>
</html>
