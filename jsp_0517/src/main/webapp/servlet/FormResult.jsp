<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-17
  Time: 오전 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>서블릿으로 데이터 처리 후 View로 전달 시 보여줄 페이지</title>
</head>
<body>
<div class="container my-4">
    <h2>서블릿 사용 후 View로 사용되는 JSP 페이지</h2>

    <ul>
        <li>사용자 이름 : ${userName}</li>
        <li>사용자 이메일 : ${userEmail}</li>
        <li>사용한 방식 : ${type}</li>
    </ul>

    <a href="/servlet/Form.jsp" class="btn btn-link">Form.jsp 페이지로</a>
</div>
</body>
</html>
