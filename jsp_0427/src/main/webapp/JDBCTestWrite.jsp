<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-27
  Time: 오전 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.bitc.jsp_0427.JDBCTest" %>

<%-- 문제 2) postWrite, postList 메소드 추가, 해당 클래스 필드의 접근 제한자를 모두 private로 수정--%>
<%-- postWirte, postList 메소드는 해당 실행 결과만 받아와서 화면에 출력--%>
<%-- 글 등록 페이지, 리스트 확인 페이지--%>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>게시판 글 작성</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-6 mx-auto">
            <form action="JDBCTestWrite.jsp" method="post">
                <div class="my-3">
                    <label for="title" class="form-label">글 제목 : </label>
                    <input type="text" class="form-control" id="title" name="title" placeholder="글 제목을 입력해주세요"/>
                </div>
                <div class="my-3">
                    <label for="user-id" class="form-label">사용자 ID : </label>
                    <input type="text" class="form-control" id="user-id" name="userId" placeholder="글쓴이의 ID를 입력해주세요"/>
                </div>
                <div class="my-3">
                    <label for="content" class="form-label">글 내용 : </label>
                    <textarea type="text" class="form-control" id="content" name="content" rows="5"></textarea>
                </div>
                <div class="my-3 d-flex justify-content-end">
                    <button type="submit" class="btn btn-primary me-2">글 등록</button>
                    <button type="reset" class="btn btn-secondary">취소</button>
                </div>
            </form>
        </div>
    </div>
        <%
            String dbDriver = application.getInitParameter("MySQLDriver");
            String dbUrl = application.getInitParameter("dbUrl");
            String opt1 = application.getInitParameter("dbUrlOpt1");
            String opt2 = application.getInitParameter("dbUrlOpt2");
            String opt3 = application.getInitParameter("dbUrlOpt3");
            String dbUserId = application.getInitParameter("dbUserId");
            String dbUserPw = application.getInitParameter("dbUserPw");

            dbUrl +=  "?" + opt1 + "&" + opt2 + "&" + opt3;

            request.setCharacterEncoding("UTF-8");
            // 클라이언트에서 가져온 데이터
            String postTitle = request.getParameter("title");
            String postContent = request.getParameter("content");
            String postId = request.getParameter("UserId");

            JDBCTest jdbc = new JDBCTest(dbDriver, dbUrl, dbUserId, dbUserPw);
            // 클라이언트에서 전송된 데이터를 데이터베이스에 저장
            int result = jdbc.postWrite(postTitle, postContent, postId);
            jdbc.close();

            if (result != 0) {
                response.sendRedirect("./postList.jsp");
            } else {
                String code = "<script>";
                code += "alert(" + "오류가 있습니다" + ");";
                code += "</script>";
                out.print(code);
            }

        %>

</div>
</body>
</html>
