<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-02
  Time: 오후 3:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.bitc.jsp_board_model1.BoardDto" %>
<%@ page import="com.bitc.jsp_board_model1.BoardDao" %>

<%
    // 이전 페이지에서 전달한 현재 글 번호 가져오기
    int postNum = Integer.parseInt(request.getParameter("postNum"));
    // 데이터베이스 연결
    BoardDao dao = new BoardDao();
    // 현재 글 내용 불러오기
    dao.dbOpen();
    BoardDto board = dao.selectBoard(postNum);
    dao.dbClose();
%>

<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>>Model1 방식 게시판 글 수정 페이지</title>
</head>
<body>

<%@include file="IsLoggedin.jsp"%>
<%@include file="Header.jsp"%>

<main class="container my-4 p-0">
    <form action="UpdateProcess.jsp" method="post">
        <%--  글 번호--%>
        <div class="row my-3">
            <div class="col-sm-6 mx-auto">
                <label for="post-num" class="form-label">글번호 : </label>
                <input type="text" class="form-control" id="post-num" name="postNum" value="<%= board.getPostNum()%>" readonly>
            </div>
        </div>
        <%--  글제목--%>
        <div class="row my-3">
            <div class="col-sm-6 mx-auto">
                <label for="post-title" class="form-label">글제목 : </label>
                <input type="text" class="form-control" id="post-title" name="postTitle" value="<%=board.getPostTitle()%>"
                       placeholder="제목을 입력해주세요">
            </div>
        </div>
        <%--  글쓴이--%>
        <div class="row my-3">
            <div class="col-sm-6 mx-auto">
                <label for="post-write-user" class="form-label">글쓴이 : </label>
                <input type="text" class="form-control" id="post-write-user" name="postWriteUser" value="<%= board.getPostWriteUser()%>" readonly>
            </div>
        </div>
        <%--  글내용--%>
            <div class="row my-3">
                <div class="col-sm-6 mx-auto">
                    <label for="post-content" class="form-label">글내용: </label>
                    <textarea class="form-control" id="post-content" name="postContent" rows="5"
                              placeholder="내용을 입력해주세요" value="<%= board.getPostContent()%>"></textarea>
                </div>
            </div>
        <div class="row my-3 ">
            <div class="col-sm-6 mx-auto d-flex justify-content-end">
                <button type="submit" class="btn btn-primary me-2">등록</button>
                <button type="reset" class="btn btn-secondary" id="btn-cancel">취소</button>
            </div>
        </div>
    </form>
</main>

<%@include file="Footer.jsp" %>

</body>
</html>
