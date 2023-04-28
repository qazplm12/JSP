<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-28
  Time: 오후 2:39
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
<h2>인클루드된 페이지에서 매개변수 확인</h2>
<%-- 액션태그 param을 통해서 전송된 매개변수 2개를 가져옴 --%>
<%= request.getParameter("loc1")%>에
<%= request.getParameter("loc2")%>이 있습니다.
</body>
</html>
