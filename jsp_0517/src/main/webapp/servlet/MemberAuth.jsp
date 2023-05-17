<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-17
  Time: 오후 12:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>MVC 패턴으로 회원인증하기</title>
</head>
<body>
<div class="container my-4">
  <h2>MVC 패턴으로 회원인증하기</h2>
  <p>
    <strong>${authMessage}</strong>
    <br>
    <a href="/MemberAuth.mvc?id=nakja&pass=1234">회원인증(관리자)</a>
    &nbsp;&nbsp;
    <a href="/MemberAuth.mvc?id=testuser1&pass=1234">회원인증(회원)</a>
    &nbsp;&nbsp;
    <a href="/MemberAuth.mvc?id=stranger&pass=1234">회원인증(비회원)</a>
  </p>
</div>
</body>
</html>
