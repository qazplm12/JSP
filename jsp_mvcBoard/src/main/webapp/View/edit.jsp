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
    <jsp:param name="pageName" value="editPage"/>
</jsp:include>
<main class="container my-4">
    <div class="row">
        <div class="col-sm-4 mx-auto">
            <form action="/mvcBoard/Edit.do" method="post" class="form-control">
                <div class="my-3">
                    <label for="post-idx" class="form-label">번호 : </label>
                    <input type="text" class="form-control" id="post-idx" name="postIdx" value="${board.postIdx}" readonly>
                </div>
                <div class="my-3">
                    <label for="post-title" class="form-label">제목 : </label>
                    <input type="text" class="form-control" id="post-title" name="postTitle"
                            placeholder="제목을 입력해주세요" value="${board.postTitle}">
                </div>
                <div class="my-3">
                    <label for="post-writer" class="form-label">작성자 : </label>
                    <input type="text" class="form-control" id="post-writer" name="postWriter"
                            placeholder="사용자 ID를 입력해주세요" value="${board.postWriter}">
                </div>
                <div class="my-3">
                    <label for="post-pass" class="form-label">비밀번호 : </label>
                    <input type="password" class="form-control" id="post-pass" name="postPass"
                            placeholder="비밀번호를 입력해주세요" value="${board.postPass}">
                </div>
                <div class="my-3">
                    <label for="post-contents" class="form-label">내용 : </label>
                    <textarea class="form-control" id="post-contents" name="postContents"
                                rows="5">${board.postContent}</textarea>
                </div>
                <%--            <div class="my-3">--%>
                <%--                <label for="post-pass" class="form-label">첨부파일 : </label>--%>
                <%--                <input type="file" class="form-control" id="post-pass" name="postPass" placeholder="">--%>
                <%--            </div>--%>
                <div class="my-3">
                    <div class="row">
                        <div class="col-sm d-grid gap-3">
                            <button type="submit" class="btn btn-success">수정</button>
                        </div>
                        <div class="col-sm d-grid gap-3">
                            <button type="reset" class="btn btn-secondary">취소</button>
                        </div>
                    </div>

                </div>
            </form>
        </div>
    </div>
</main>
<jsp:include page="/layout/footer.jsp"/>

</body>
</html>
