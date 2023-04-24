<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-24
  Time: 오전 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>내장객체 - out</title>
</head>
<body>
<div class="container">
  <%
    out.print("출력되지 않는 텍스트");
    out.clearBuffer();

    out.print("<h2>out 내장 객체</h2>");

    out.print("출력 버퍼의 크기 : " + out.getBufferSize() + "<br>");
    out.print("남은 버퍼의 크기 : " + out.getRemaining() + "<br>");

    out.flush();
    out.print("flush 후 버퍼의 크기 : " + out.getRemaining() + "<br>");

    out.print(1);
    out.print(false);
    out.print('가');
  %>
</div>
</body>
</html>
