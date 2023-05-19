<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-17
  Time: 오후 3:06
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

<jsp:include page="/layout/header.jsp">
    <jsp:param name="pageName" value="writePage"/>
</jsp:include>
<main class="container my-4 py-4">
    <div class="my-3 row">
        <div class="col-sm-4 mx-auto">
            <form action="/mvcBoard/Write.do" method="post" class="form-control" enctype="multipart/form-data">
                <div class="my-3">
                    <label for="title" class="form-label">제목 : </label>
                    <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요">
                </div>
                <div class="my-3">
                    <label for="writer" class="form-label">작성자 : </label>
                    <input type="text" class="form-control" id="writer" name="writer" placeholder="작성자 ID를 입력하세요">
                </div>
                <div class="my-3">
                    <label for="pass" class="form-label">비밀번호 : </label>
                    <input type="password" class="form-control" id="pass" name="pass" placeholder="글삭제 비밀번호를 입력하세요">
                </div>
                <div class="my-3">
                    <label for="contents" class="form-label">글내용 : </label>
                    <textarea class="form-control" id="contents" name="contents" rows="5"></textarea>
                </div>
                <div class="my-3">
                    <label for="file" class="form-label">첨부파일 : </label>
                    <input type="file" class="form-control" id="file" name="file" placeholder="글과 함께 등록할 파일을 선택하세요">
                </div>
                <div class="row">
                    <div class="col-sm d-grid">
                        <button type="submit" class="btn btn-primary">글 등록</button>
                    </div>
                    <div class="col-sm d-grid">
                        <button type="reset" class="btn btn-secondary">취소</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</main>
<jsp:include page="/layout/footer.jsp"/>
</body>
</html>
