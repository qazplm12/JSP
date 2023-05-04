<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-02
  Time: 오전 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.bitc.jsp_board_model1.BoardDto" %>
<%@ page import="com.bitc.jsp_board_model1.BoardDao" %>

<%
    // BoardList에서 넘겨준 글 번호 가져오기
    int postNum = Integer.parseInt(request.getParameter("postNum"));

    // 데이터 베이스 연결을 위해 BoardDao 객체 생성
    BoardDao dao = new BoardDao();
    dao.dbOpen();

    // 현재 글의 조회수 업데이트
    dao.updateVisitCount(postNum);

    // 글 번호를 매개변수로 하여 게시글의 해당 글 내용을 가져오기(BoardDto 타입의 객체에 저장)
    BoardDto board = dao.selectBoard(postNum);
    dao.dbClose();
%>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <title>model1 방식 게시판 글 확인 페이지</title>
    <script>
        $(document).ready(function () {
            $("#btn-list").on("click", function () {
                history.back();
            });

            $("#btn-delete").on("click", function () {
                let confirmed = confirm("정말로 삭제하시겠습니까?");

                // 단순 링크를 사용하여 DeleteProcess.jsp로 이동하여 삭제
                if (confirmed) {
                    const postNum = $("#post-num").val();
                    let url = "DeleteProcess.jsp?postNum=" + postNum;
                    location.href = url;

                }
            });
            $("#btn-edit").on("click", function () {
                // id값이 post-num인 html 태그의 value값을 가져오기
                const postNum = $("#post-num").val();
                // 이동하려고 하는 URL 만들기
                const url = "BoardUpdate.jsp?postNum=" + postNum;
                // 자바스크립트의 페이지 이동 명령을 사용하여 페이지 이동
                location.href = url;
            });
        });
    </script>

</head>
<body>

<%@include file="Header.jsp" %>

<main class="container my-4">
    <%-- 글번호, 글제목--%>
    <div class="row my-3">
        <div class="col-sm">
            <label for="post-num" class="form-label">글번호 : </label>
            <input type="text" class="form-control" id="post-num" name="postNum" value=<%=board.getPostNum()%> disabled>
        </div>
        <div class="col-sm">
            <label for="post-title" class="form-label">글제목 : </label>
            <input type="text" class="form-control" id="post-title" name="postTitle" value="<%=board.getPostTitle()%>">
        </div>
    </div>
    <%-- 글쓴이, 등록시간, 조회수--%>
    <div class="row my-3">
        <div class="col-sm">
            <label for="post-write-user" class="form-label">글쓴이 : </label>
            <input type="text" class="form-control" id="post-write-user" name="postWritUser"
                   value="<%=board.getPostWriteUser()%>" disabled>
        </div>
        <div class="col-sm">
            <label for="post-date" class="form-label">등록시간 : </label>
            <input type="text" class="form-control" id="post-date" name="postDate" value="<%=board.getPostDate()%>"
                   disabled>
        </div>
        <div class="col-sm">
            <label for="post-visit-count" class="form-label">조회수 : </label>
            <input type="text" class="form-control" id="post-visit-count" name="postVisitCount"
                   value="<%=board.getPostVisitCount()%>" disabled>
        </div>
    </div>
    <%-- 글 내용 --%>
    <div class="row">
        <div class="col-sm">
            <label for="post-content" class="form-label">글내용 : </label>
            <textarea name="postContent" id="post-content" class="form-control"
                      rows="5"><%=board.getPostContent()%></textarea>
        </div>

    </div>
    <%-- 버튼--%>
    <div class="row mt-3">
        <div class="col-sm d-flex justify-content-start">
            <button type="button" id="btn-list" class="btn btn-secondary ">목록</button>
        </div>
        <% if (session.getAttribute("userId") != null) {

            if (session.getAttribute("userId").toString().equals(board.getPostWriteUser())) {
        %>
        <%-- flex-box --%>
        <div class="col-sm d-flex justify-content-end">
            <%-- 1. a 태그를 사용하여 BoardUpdate.jsp로 이동--%>
            <a href="BoardUpdate.jsp?postNum=<%=board.getPostNum()%>" class="btn btn-primary me-2" id="btn-edit">수정</a>
            <%-- 2. 자바스크립트를 사용하여 BoardUpdate.jsp로 이동--%>

            <%--            <button type="button" id="btn-edit" class="btn btn-primary me-2">수정</button>--%>
            <%-- 1. form을 사용한 방식--%>
            <%-- form 사용 시 form 태그의 자식태그로 포함되어 있는 input 태그의 데이터만 서버로 전송--%>
            <%--            <form action="DeleteProcess.jsp" method="get">--%>
            <%--                <button type="submit" class="btn btn-danger">삭제</button>--%>
            <%--                <input type="hidden" name="postNum" value="<%= board.getPostNum()%>">--%>
            <%--            </form>--%>
            <%-- 2. a 태그를 사용한 방식 --%>
            <%-- a 태그를 이용하여 직접 DeleteProcess.jsp로 접속하여 게시물 삭제--%>
            <%--            <a href="DeleteProcess.jsp?postNum=<%= board.getPostNum()%>" class ="btn btn-danger">삭제</a>--%>
            <%-- 3. 자바스크립트를 사용한 방식 --%>
            <button type="button" class="btn btn-danger" id="btn-delete">삭제</button>
        </div>
    </div>
    <%
            }
        }
    %>


</main>

<%@include file="Footer.jsp" %>

</body>
</html>
