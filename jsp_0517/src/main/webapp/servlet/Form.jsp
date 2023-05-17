<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-17
  Time: 오전 9:47
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
    <form action="/servlet/FormProcess.do" method="post">
        <div class="my-3">
            <label for="user-name" class="form-label">사용자 이름 : </label>
            <input type="text" class="form-control" id="user-name" name="userName" placeholder="사용자 이름을 입력하세요 ">
        </div>
        <div class="my-3">
            <label for="user-email" class="form-label">사용자 이메일 : </label>
            <input type="text" class="form-control" id="user-email" name="userEmail" placeholder="사용자 이메일을 입력하세요 ">
        </div>
        <div class="my-3">
            <button type="submit" class="btn btn-primary">확인</button>
        </div>
    </form>
</div>
</body>
</html>
