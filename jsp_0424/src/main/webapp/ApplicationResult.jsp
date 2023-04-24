<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-24
  Time: 오후 3:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.util.Set" %>
<%@ page import="com.bitc.jsp_0424.Person" %>
<%@ page import="java.util.Map" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>내장 객체 범위 - application </title>
</head>
<body>
  <h2>application 영역의 속성 읽기</h2>
<%
  Map<String, Person> maps = (Map<String, Person>) application.getAttribute("maps");
  Set<String> keys = maps.keySet();
  for (String key : keys) {
    Person person = maps.get(key);
    out.print(String.format("이름 : %s, 나이 : %d<br>",
            person.getName(), person.getAge()));
  }
%>
</body>
</html>
