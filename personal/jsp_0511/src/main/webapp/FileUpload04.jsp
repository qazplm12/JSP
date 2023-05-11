<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-11
  Time: 오후 3:21
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
  <form action="FileUpload04Process.jsp" method="post" enctype="multipart/form-data">
    <label for="user-name">이름 : </label>
    <input type="text" id="user-name" name="userName"><br>
    <label for="title">제목 : </label>
    <input type="text" id="title" name="title"><br>
    <label for="file">파일 : </label>
    <input type="file" id="file" name="file"><br>
    <button type="submit" class="btn btn-primary">파일 업로드</button>
  </form>
</div>
</body>
</html>
