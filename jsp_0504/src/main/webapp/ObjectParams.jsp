<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-04
  Time: 오전 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.bitc.jsp_0504.Person" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>표현 언어 - 객체 전달</title>
</head>
<body>
<%
 //내장객체 request에 데이터 저장
  request.setAttribute("personObj", new Person("홍길동", 33));
  request.setAttribute("stringObj", "나는 문자열");
  request.setAttribute("integerObj", 99);
%>
<%-- forward시 액션태그의 param을 사용하여 매개변수로 데이터 전달--%>
<jsp:forward page="ObjectResult.jsp">
  <jsp:param value="10" name="firstNum" />
  <jsp:param value="20" name="secondNum" />
</jsp:forward>
</body>
</html>
