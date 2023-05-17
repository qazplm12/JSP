<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-17
  Time: 오후 1:56
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
            <form action="/servlet/LoginProcess.do" method="post" class="form-control">
                <div class="my-3">
                    <label for="user-id" class="form-label">User ID : </label>
                    <input type="text" id="user-id" name="userId" class="form-control" placeholder="사용자 ID를 입력하세요.">
                </div>
                <div class="my-3">
                    <label for="user-pw" class="form-label">User PW : </label>
                    <input type="password" id="user-pw" name="userPw" class="form-control" placeholder="사용자 PW를 입력하세요.">
                </div>
                <div class="my-3 d-grid gap-3">
                    <button type="submit" class="btn btn-primary">Login</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
