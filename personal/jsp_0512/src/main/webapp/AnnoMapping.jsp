<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-12
  Time: 오후 3:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Title</title>
</head>
<body>
<div class="container my-4">
    <h2>어노테이션으로 매핑하기</h2>
    <p>
        <strong>${message}</strong>
        <br>
        <a href="<%= request.getContextPath()%>/Servlet/AnnoMapping.do" class="btn btn-link">바로가기</a>
    </p>
</div>
</body>
</html>
