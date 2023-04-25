<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-25
  Time: 오전 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>쿠키 설정</title>
</head>
<body>
<div class="container">
    <h2>쿠키값 확인하기(쿠키가 생성된 이후의 페이지)</h2>
    <%
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                String cookieName = cookies[i].getName();
                String cookieValue = cookies[i].getValue();
                out.println(String.format("쿠키명 : %s - 쿠키값 : %s<br/>",
                        cookieName, cookieValue));
            }
        }
    %>
</div>
</body>
</html>
