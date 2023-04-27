<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-27
  Time: 오전 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.bitc.jsp_0427.JDBCTest" %>
<%@ page import="java.sql.*" %>
<%@ page import ="java.util.*"%>
<%--    문제 1) JDBConnect 클래스와 Statement 클래스 및 ResultSet을 사용하여 데이터 베이스 정보를 가져오는 프로그램을 작성하세요--%>
<%--    board 테이블의 정보를 가져와서 화면에 table 태그로 출력 --%>
<%-- 문제 2) postWrite, postList 메소드 추가, 해당 클래스 필드의 접근 제한자를 모두 private로 수정--%>
<%-- postWirte, postList 메소드는 해당 실행 결과만 받아와서 화면에 출력--%>
<%-- 글 등록 페이지, 리스트 확인 페이지--%>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>게시판 글 리스트</title>
</head>
<body>
<%
    String dbDriver = application.getInitParameter("MySQLDriver");
    String dbUrl = application.getInitParameter("dbUrl");
    String opt1 = application.getInitParameter("dbUrlOpt1");
    String opt2 = application.getInitParameter("dbUrlOpt2");
    String opt3 = application.getInitParameter("dbUrlOpt3");
    String dbUserId = application.getInitParameter("dbUserId");
    String dbUserPw = application.getInitParameter("dbUserPw");

    dbUrl +=  "?" + opt1 + "&" + opt2 + "&" + opt3;

    List<Map<String, String>> dataList = null;

    JDBCTest jdbc = new JDBCTest(dbDriver, dbUrl, dbUserId, dbUserPw);
    jdbc.close();

    // 게시판 글 목록을 가져와서 저장할 변수

%>
<div class="container">
    <table class="table table-hover table-striped text-center">
        <thead>
        <tr>
            <td>글번호</td>
            <td>글제목</td>
            <td>글내용</td>
            <td>글쓴이</td>
            <td>작성일</td>
            <td>조회수</td>
        </tr>
        </thead>
        <tbody>
<%
        for (Map<String, String> data : dataList) {
            String postNum = data.get("postNum");
            String postNum = data.get("postNum");
            String postNum = data.get("postNum");
            String postNum = data.get("postNum");
            String postNum = data.get("postNum");
            String postNum = data.get("postNum");
        }



        </tbody>
    </table>
</div>
</body>
</html>
