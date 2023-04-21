<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-21
  Time: 오후 3:29
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
    <%
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String sex = request.getParameter("sex");
        String[] favo = request.getParameterValues("favo");
        String favoStr = "";
        if (favo != null) {
            for (int i = 0; i < favo.length; i++) {
                favoStr += favo[i] + " ";
            }
        }
        String intro = request.getParameter("intro").replace("\r\n", "<br>");
    %>
    <ul>
        <li>아이디 : <%= id %></li>
        <li>성별 : <%= sex %></li>
        <li>관심사항 : <%= favoStr %></li>
        <li>자기소개 : <%= intro %></li>
    </ul>
</div>
</body>
</html>
