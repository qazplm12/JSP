<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Title</title>
    <script>
        $(document).ready(function () {
            $("#btn-list").on("click", function () {
                history.back();
            });

            $("#btn-edit").on("click", function () {
                // const postIdx = $("#post-idx").val();
                location.href = "/mvcBoard/Pass.do?mode=edit&idx=${board.postIdx}";
            });

            $("#btn-delete").on("click", function () {
                // const postIdx = $("#post-idx").val();
                location.href = "/mvcBoard/Pass.do?mode=delete&idx=${board.postIdx}";
            });

            $("#post-ofile").on("click", function () {
                location.href = "/mvcBoard/Download.do?ofile=${board.postOfile}&sfile=${board.postSfile}&idx=${board.postIdx}";
            });

        });

    </script>
</head>
<body>
<c:import url="/layout/header.jsp">
    <c:param name="pageName" value="viewPage"/>
</c:import>
<main class="container my-4 py-4">
    <div class="my-3 row">
        <div class="col-sm">
            <label for="post-idx" class="form-label">번호 : </label>
            <input type="text" class="form-control" id="post-idx" name="postIdx" value="${board.postIdx}" readonly>
        </div>
        <div class="col-sm">
            <label for="post-writer" class="form-label">작성자 : </label>
            <input type="text" class="form-control" id="post-writer" name="postWriter" value="${board.postWriter}"
                   readonly>
        </div>
    </div>
    <div class="my-3 row">
        <div class="col-sm">
            <label for="post-date" class="form-label">작성일 : </label>
            <input type="text" class="form-control" id="post-date" name="postDate" value="${board.postDate}" readonly>
        </div>
        <div class="col-sm">
            <label for="post-visits" class="form-label">조회수 : </label>
            <input type="text" class="form-control" id="post-visits" name="postVisits" value="${board.postVisits}"
                   readonly>
        </div>
    </div>
    <div class="my-3 row">
        <div class="col-sm">
            <label for="post-title" class="form-label">제목 : </label>
            <input type="text" class="form-control" id="post-title" name="postTitle" value="${board.postTitle}"
                   readonly>
        </div>
    </div>
    <div class="my-3 row">
        <div class="col-sm">
            <label for="post-contents" class="form-label">내용 : </label>
            <textarea type="text" class="form-control" id="post-contents" name="postContents"
                      rows="5">${board.postContent}</textarea>
        </div>
    </div>
    <div class="my-3 row">
        <div class="col-sm">
            <label for="post-ofile" class="form-label">첨부파일 : </label>
            <input type="button" class="form-control text-start" id="post-ofile" name="postOfile"
                   value="${board.postOfile}" readonly>
            <%-- /mvcBoard/Download.do?ofile=${board.postOfile}&sfile=${board.postSfile}&idx=${board.postIdx} --%>
        </div>
        <div class="col-sm">
            <label for="post-dn-count" class="form-label">다운로드 수 : </label>
            <input type="text" class="form-control" id="post-dn-count" name="postDnCount" value="${board.postDnCount}"
                   readonly>
        </div>
    </div>
    <div class="my-3 row">
        <div class="col-sm">
            <button type="button" class="btn btn-secondary" id="btn-list">목록</button>
        </div>
        <div class="col-sm d-flex justify-content-end">
            <button type="button" class="btn btn-warning me-2" id="btn-edit">수정</button>
            <button type="button" class="btn btn-danger" id="btn-delete">삭제</button>
        </div>
    </div>
</main>
<c:import url="/layout/footer.jsp"/>
</body>
</html>
