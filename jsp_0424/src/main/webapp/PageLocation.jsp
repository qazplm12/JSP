<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-24
  Time: 오후 1:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.bitc.jsp_0424.Person" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>내장 객체 범위 - page</title>
</head>
<body>
<h2>이동 후 page 영역의 속성값 읽기</h2>
<%
    // 페이지가 변경 되었으므로 기존에 가지고 있는 page 내장 객체는 현재 페이지의 page 내장 객체와 다른 객체임
    Object pInteger = pageContext.getAttribute("pageInteger");
    Object pString = pageContext.getAttribute("pageString");
    Object pPerson = pageContext.getAttribute("pagePerson");
%>
<ul>
    <li>Integer 객체 : <%= (pInteger == null) ? "값 없음" : pInteger %></li>
    <li>String 객체 : <%= (pString == null) ? "값 없음" : pString %></li>
    <li>Person 객체 : <%= (pPerson == null) ? "값 없음" :((Person) pPerson).getName() %></li>
</ul>

</body>
</html>
