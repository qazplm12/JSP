<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-27
  Time: 오전 9:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@page import="com.bitc.jsp_0427.JDBConnect" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Title</title>
</head>
<body>
<div class="container">
    <h2>JDBC 테스트</h2>
<%
//    JDBConnect jdbc1 = new JDBConnect();
//    jdbc1.close();

    String Driver = application.getInitParameter("MySQLDriver");
    String dbUrl = application.getInitParameter("dbUrl");
    String opt1 = application.getInitParameter("dbUrlOpt1");
    String opt2 = application.getInitParameter("dbUrlOpt2");
    String opt3 = application.getInitParameter("dbUrlOpt3");
    String dbUserId = application.getInitParameter("dbUserId");
    String dbUserPw = application.getInitParameter("dbUserPw");

    dbUrl += "?" + opt1 + "&" + opt2 + "&" + opt3;

    JDBConnect jdbc2 = new JDBConnect(Driver, dbUrl, dbUserId, dbUserPw);
    jdbc2.close();

%>

</div>
</body>
</html>
