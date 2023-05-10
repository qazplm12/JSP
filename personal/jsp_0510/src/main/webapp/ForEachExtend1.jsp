<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-10
  Time: 오후 12:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>JSTL - forEach 예제</title>
</head>
<body>
<div class="container my-4">
    <h4>향상된 for문 형태의 forEach 태그</h4>
    <%
    // 스크립틀릿을 사용하여 배열 생성
        String[] rgba = {"Red", "Green", "Blue", "Black"};
    %>
<%-- jstl의 forEach로 향상된 for문 구현 --%>
    <c:forEach items="<%=rgba%>" var="c">
        <span style="color:${c};">${c}</span>
    </c:forEach>

    <h4>varStatus 속성 살펴보기</h4>
    <table border="1" class="table">
        <c:forEach items="<%= rgba%>" var="c" varStatus="loop">
            <tr>
                <td>count : ${loop.count}</td>
                <td>index : ${loop.index}</td>
                <td>current : ${loop.current}</td>
                <td>first : ${loop.first}</td>
                <td>last : ${loop.last}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
