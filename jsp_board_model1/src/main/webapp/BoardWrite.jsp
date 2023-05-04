<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-02
  Time: 오전 9:15
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

<%@include file="IsLoggedin.jsp"%>
<%@include file="Header.jsp" %>

<main class="container my-4">
    <div class="row">
        <div class="col-sm-6 mx-auto ">
            <form action="WriteProcess.jsp" name="writeFrm" method="post" class="form-control">
                <div class="my-3">
                    <label for="post-title" class="form-label"> 제목 : </label>
                    <input type="text" class="form-control" id="post-title" name="postTitle" placeholder="제목을 입력하세요"></inpu>
                </div>
                <div class="my-3">
                    <label for="post-content" class="form-label">내용 :</label>
                    <textarea id="post-content" rows="5" class="form-control" name="postContent" placeholder="내용을 입력하세요"></textarea>
                </div>
                <div class="my-3 d-grid gap-3">
                    <button type="submit" class="btn btn-primary">글 등록</button>
                    <button type="reset" class="btn btn-secondary">취소 </button>
                </div>
            </form>
        </div>
    </div>
</main>

<%@include file="Footer.jsp" %>

</body>
</html>
