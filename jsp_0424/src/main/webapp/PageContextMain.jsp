<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-24
  Time: 오후 12:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.bitc.jsp_0424.Person" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    pageContext.setAttribute("pageInteger", 1000);
    pageContext.setAttribute("pageString", "페이지 영역의 문자열");
    pageContext.setAttribute("pagePerson", new Person("한석봉", 99));
%>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>내장 객체 범위 - page</title>
</head>
<body>
<h2>page 영역의 속성값 읽기</h2>
<%
    // page 내장 객체에 저장된 내용을 출력 시 원본 타입으로 강제 타입 변환이 필요함
    int pInteger = (Integer) (pageContext.getAttribute("pageInteger"));
    // toString() 메소드를 사용하여 문자열로 변경
    String pString = pageContext.getAttribute("pageString").toString();
    // Person 클래스 타입의 객체로 타입 변경
    Person pPerson = (Person)(pageContext.getAttribute("pagePerson"));

%>
<ul>
    <li>Integer 객체 : <%= pInteger%></li>
    <li>String 객체 : <%= pString%></li>
    <li>Person 객체 : <%= pPerson.getName() %>, <%= pPerson.getAge()%></li>
</ul>

<%-- 디렉티브 태그를 통해서 현재 파일에 포함시킨 파일도 page 내장 객체를 공유--%>
<h2>include 된 파일에서 page 영역 읽어오기</h2>
<%@ include file="PageInclude.jsp" %>

<h2>페이지 이동 후 page 영역 읽어오기</h2>
<a href="PageLocation.jsp">PageLocation.jsp 바로가기</a>

</body>
</html>

