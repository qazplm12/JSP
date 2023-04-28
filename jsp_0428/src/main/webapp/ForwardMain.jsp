<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-28
  Time: 오후 12:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
  pageContext.setAttribute("pAttr", "김유신");
  request.setAttribute("rAttr", "계백");
%>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>액션태그 - forward</title>
</head>
<body>
<div class="container my-4">
  <h2>액션 태그를 이용한 포워딩</h2>
  <jsp:forward page="/ForwardSub.jsp"/>
</div>
</body>
</html>
