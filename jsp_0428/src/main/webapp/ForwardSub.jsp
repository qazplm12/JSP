<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-28
  Time: 오후 12:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>액션태그 - forward</title>
</head>
<body>
<div class="container my-4">
    <h2>포워드 결과</h2>
    <ul>
        <%-- 액션 태그의 forward 명령으로 페이지가 이동했기 때문에 page를 공유할 수 없음--%>
        <li>
            page 영역 : <%= pageContext.getAttribute("pAttr")%>
        </li>
        <%-- 액션 태그의 forward 명령으로 페이지가 이동했지만 클라이언트를 거치지 않고
            서버끼리 페이지 이동이기 때문에 request 내장객체를 공유하고 있음--%>
        <li>
            request 영역 : <%= request.getAttribute("rAttr")%>
        </li>
    </ul>
</div>
</body>
</html>
