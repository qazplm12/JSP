<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-28
  Time: 오후 2:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>액션태그 - UseBean</title>
</head>
<body>
<div class="container my-4">
    <h2>액션 태그로 폼값 한번에 받기</h2>
    <form action="UseBeanAction.jsp" method="post">
        이름 : <input type="text" name="name"> <br>
        나이 : <input type="text" name="age"> <br>
        <input type="submit" value="폼값 전송">
    </form>
</div>

</body>
</html>
