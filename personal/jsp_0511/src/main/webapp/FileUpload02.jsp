<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-11
  Time: 오후 2:05
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
    <form action="FileUpload02Process.jsp" method="post" enctype="multipart/form-data">
        <div class="my-4">
            <label for="name1" class="form-label">이름 1</label>
            <input type="text" id="name1" name="name1" class="form-control">
            <label for="title1" class="form-label">제목 1</label>
            <input type="text" id="title1" name="title1" class="form-control">
            <label for="file1" class="form-label">파일 1</label>
            <input type="file" id="file1" name="file1" class="form-control">
        </div>
        <div class="my-4">
            <label for="name2" class="form-label">이름 2</label>
            <input type="text" id="name2" name="name2" class="form-control">
            <label for="title2" class="form-label">제목 2</label>
            <input type="text" id="title2" name="title2" class="form-control">
            <label for="file2" class="form-label">파일 2</label>
            <input type="file" id="file2" name="file2" class="form-control">
        </div>
        <div class="my-4">
            <label for="name3" class="form-label">이름 3</label>
            <input type="text" id="name3" name="name3" class="form-control">
            <label for="title3" class="form-label">제목 3</label>
            <input type="text" id="title3" name="title3" class="form-control">
            <label for="file3" class="form-label">파일 3</label>
            <input type="file" id="file3" name="file3" class="form-control">
        </div>

        <button type="submit" class="btn btn-primary">파일 올리기</button>

    </form>
</div>
</body>
</html>
