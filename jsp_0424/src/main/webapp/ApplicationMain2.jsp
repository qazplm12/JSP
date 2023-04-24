<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-24
  Time: 오후 3:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.bitc.jsp_0424.Person" %>
<%@ page import="java.util.Map" %>

<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>내장 객체 범위 - application</title>
</head>
<body>
<h2>application 영역의 공유</h2>
<%
  Map<String, Person> maps = new HashMap<>();
  maps.put("actor1", new Person("이수일", 30));
  maps.put("actor2", new Person("심순애", 28));
  application.setAttribute("maps", maps);
%>
application 영역에 속성이 저장되었습니다.

</body>
</html>
