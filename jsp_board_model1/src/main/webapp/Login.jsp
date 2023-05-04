<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-03
  Time: 오전 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>model1 방식 게시판 만들기</title>
</head>
<body>
<%@include file="Header.jsp" %>
<main class="container my-4">
    <div class="row">
        <div class="col-sm-4 mx-auto">
            <form action="LoginProcess.jsp" method="post">
                <div class="form-floating my-3">
                    <input type="text" class="form-control" id="user-id" name="userId" placeholder="ID를 입력하세요">
                    <label for="user-id" class="form-label">User ID</label>
                </div>
                <div class="form-floating my-3">
                    <input type="password" class="form-control" id="user-pw" name="userPw" placeholder="Password를 입력하세요">
                    <label for="user-pw" class="form-label">User Password</label>
                </div>
                <div class="my-3 d-grid gap-3">
                    <button type="submit" class="btn btn-primary">로그인</button>
                    <button type="button" class="btn btn-secondary">취소</button>
                </div>
            </form>
        </div>
    </div>
</main>
<%@include file="Footer.jsp" %>

</body>
</html>
