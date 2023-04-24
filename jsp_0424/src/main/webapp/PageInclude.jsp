<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-24
  Time: 오후 1:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@page import ="com.bitc.jsp_0424.Person" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>내장 객체 범위 - page</title>
</head>
<body>
<h4>Include 페이지</h4>
<%
    // page 내장 객체를 공유하고 있으므로 page 내장객체가 가지고 있는 데이터를 가져옴
  int pInteger2 = (Integer) (pageContext.getAttribute("pageInteger"));
//  String pString2 = pageContext.getAttribute("pageString").toString();
  Person pPerson2 = (Person) (pageContext.getAttribute("pagePerson"));
%>
<ul>
  <li>Integer 객체 : <%= pInteger2 %></li>
<%--    page 내장 객체가 가지고 있는 데이터를 그대로 출력 --%>
  <li>String 객체 : <%= pageContext.getAttribute("pageString") %></li>
  <li>Person 객체 : <%= pPerson2.getName() %>, <%=pPerson2.getAge() %></li>
</ul>
</body>
</html>