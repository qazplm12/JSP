<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-26
  Time: 오후 1:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Statement로 SQL 쿼리 사용하기</title>
</head>
<body>
<div class="container">
    <table class="table table-hover table-striped">
        <thead>
        <tr>
            <th>아이디</th>
            <th>비밀번호</th>
            <th>이름</th>
            <th>등록날짜</th>
        </tr>
        </thead>
        <tbody>

        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                String dbUrl = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
                String dbUserId = "full505";
                String dbUserPw = "full505";

                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(dbUrl, dbUserId, dbUserPw);

                stmt = conn.createStatement();

                // 기존의 SQL 쿼리문 사용, SELECT 쿼리문 생성
                String sql = "SELECT id, pass, name, regidate FROM member ";

                // Statement를 통해서 데이터 베이스에 SELECT 쿼리문을 실행 후 그 결과를 받아옴
                rs = stmt.executeQuery(sql);

                // rs.next() : 데이터가 없으면 false, 있으면 데이터를 가져옴
                while (rs.next()) {
                    // getString(컬럼명) : 지정한 컬럼명에 해당하는 데이터를 가져옴
                    String userId = rs.getString("id");
                    String userPw = rs.getString("pass");
                    String userName = rs.getString("name");
                    String userRegidate = rs.getString("regidate");

        %>
        <tr>
            <td><%= userId%></td>
            <td><%= userPw%></td>
            <td><%= userName%></td>
            <td><%= userRegidate%></td>
        </tr>
    <%
            }
        } catch (SQLException e) {
            out.println("데이터 베이스 사용 시 오류가 발생했습니다.<br>");
            out.println("SQLException : " + e.getMessage());
        } finally {
            try {
                // ResultSet > Statement > Connection 순으로 close() 사용
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
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
