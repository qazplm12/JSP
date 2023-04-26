<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-26
  Time: 오후 3:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>

<%
    PreparedStatement pstmt = null;
    ResultSet rs = null;
%>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Title</title>
</head>
<body>
<div class="container my-4">
    <table class="table table-hover table-striped">
        <thead>
        <tr>
            <th>글번호</th>
            <th>글제목</th>
            <th>글내용</th>
            <th>글쓴이</th>
            <th>등록날짜</th>
            <th>조회수</th>
        </tr>
        </thead>
        <tbody>
        <%
            try {

                String sql = "SELECT * FROM board";
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();

                while (rs.next()) {
                    int boardNum = rs.getInt("num");
                    String boardTitle = rs.getString("title");
                    String boardContent = rs.getString("content");
                    String boardId = rs.getString("id");
                    String boardPostdate = rs.getString("postdate");
                    int boardVisitCount = rs.getInt("visitcount");
        %>
        <tr>
            <td><%= boardNum%></td>
            <td><%= boardTitle%></td>
            <td><%= boardContent%></td>
            <td><%= boardId%></td>
            <td><%= boardPostdate%></td>
            <td><%= boardVisitCount%></td>
        </tr>
        <%
                }

            } catch (SQLException e) {
                out.println("데이터 베이스 사용 중 오류가 발생했습니다.<br>");
                out.println("SQLException : " + e.getMessage());
            } finally {
                try {
                    if (rs != null) {
                        rs.close();
                    }
                    if (pstmt != null) {
                        pstmt.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                } catch (Exception e) {

                }
            }
        %>
        </tbody>
    </table>
</div>

</body>
</html>
