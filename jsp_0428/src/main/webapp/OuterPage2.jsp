<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-28
  Time: 오후 12:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>액션태그 - include</title>
</head>
<body>
<div class="container my-4 border">
  <h2>외부 파일 2</h2>
  <%
    String newVar2 = "백제 온조왕";
  %>
  <ul>
    <li>page 영역 속성 : <%= pageContext.getAttribute("pAttr")%></li>
    <li>request 영역 속성 : <%= request.getAttribute("rAttr")%></li>
  </ul>
</div>
</body>
</html>
