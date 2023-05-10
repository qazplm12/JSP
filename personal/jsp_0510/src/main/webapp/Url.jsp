<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-10
  Time: 오후 2:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>JSTL - Url 예제</title>
</head>
<body>
<div class="container my-4">
  <h4>Url 태그로 링크 걸기</h4>
  <c:url value="OtherPage.jsp" var="url">
    <c:param name="user_param1" value="Must"/>
    <c:param name="user_param2">Have</c:param>
  </c:url>
    <a href="${url}">OtherPage.jsp 바로가기</a>
</div>
</body>
</html>
