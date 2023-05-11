<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-11
  Time: 오전 11:38
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
      <form action="FileUpload01Process.jsp" method="post" enctype="multipart/form-data" class="form-control">
        <div class="my-3">
          <label for="user-name" class="form-label">이름 : </label>
          <input type="text" class="form-control" id="user-name" name="userName">
        </div>
        <div class="my-3">
          <label for="title" class="form-label">제목 : </label>
          <input type="text" class="form-control" id="title" name="title">
        </div>
        <div class="my-3">
          <label for="file" class="form-label">첨부파일 : </label>
          <input type="file" id="file" name="file" class="form-control">
        </div>
        <div class="my-3 d-grid gap-3">
          <button type="submit" class="btn btn-primary">전송</button>
        </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>
