<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-24
  Time: 오후 2:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.bitc.jsp_0424.Person" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>내장 객체 범위 - Request</title>
</head>
<body>
<h2>포워드로 전달된 페이지</h2>
<h3>RequestForward.jsp 페이지</h3>
<h4>RequestMain 파일의 리퀘스트 영역 속성 읽기</h4>
<%
    //forward로 인하여 이전 페이지의 request, response 내장 객체를 가져와서 사용함
    Person pPerson = (Person) (request.getAttribute("requestPerson"));
%>

<ul>
    <li>String 객체 : <%= request.getAttribute("requestString")%></li>
    <li>Person 객체 : <%= pPerson.getName()%>, <%= pPerson.getAge()%></li>
</ul>

<h4>매개변수로 전달된 값 출력하기</h4>
<%
    // 한글 출력을 위해서 추가한 내용
    request.setCharacterEncoding("UTF-8");
    out.println(request.getParameter("paramHan"));
    out.println(request.getParameter("paramEng"));
%>
</body>
</html>
