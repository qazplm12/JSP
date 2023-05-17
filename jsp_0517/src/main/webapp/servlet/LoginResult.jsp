<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-17
  Time: 오후 2:23
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
    <div class="row">
        <div class="col-sm-4 mx-auto">
            <p><strong>${userName}<strong>  ${userGrade}님 반갑습니다.</p>
            <a href="/servlet/Login.jsp" class="btn btn-link">로그인 페이지</a>
        </div>
    </div>
</div>
</body>
</html>
