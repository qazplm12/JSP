<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-26
  Time: 오전 11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Statement로 SQL쿼리 사용하기</title>
</head>
<body>
<div class="container my-4">
    <div class="row">
        <div class="col-sm-6 mx-auto">
            <form action="insert01_process.jsp" method="post">
                <div class="my-3">
                    <label for="user-id" class="form-label">사용자 ID :</label>
                    <input type="text" class="form-control" id="user-id" name="userId" placeholder="사용자 ID를 입력하세요"/>
                </div>
                <div class="my-3">
                    <label for="user-pw" class="form-label">사용자 PW :</label>
                    <input type="text" class="form-control" id="user-pw" name="userPw" placeholder="사용자 PW를 입력하세요"/>
                </div>
                <div class="my-4">
                    <label for="user-name" class="form-label">사용자명 :</label>
                    <input type="text" class="form-control" id="user-name" name="userName" placeholder="사용자명을 입력하세요"/>
                </div>
                <div class="my-4 d-grid gap-3">
                    <button type="submit" class="btn btn-primary">사용자 추가</button>
                    <button type="reset" class="btn btn-secondary">취소</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
