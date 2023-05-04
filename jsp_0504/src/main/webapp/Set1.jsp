<%@ page import="java.util.Date" %>
<%@ page import="com.bitc.jsp_0504.Person" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-04
  Time: 오후 3:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>JSTL - set</title>
</head>
<body>
<div class="container my-4">
    <c:set var="directVar" value="100"/>
    <c:set var="elVar" value="${directVar mod 5}"/>
    <c:set var="expVar" value="<%= new Date()%>"/>
    <c:set var="betweenVar">변수값 요렇게 설정</c:set>

    <h4>EL을 이용해 변수 출력</h4>
    <ul>
        <li>directVar : ${pageScope.directVar}</li>
        <li>elVar : ${elVar}</li>
        <li>expVar : ${expVar}</li>
        <li>betweenVar : ${betweenVar}</li>
    </ul>

    <h4>자바빈즈 생성 1 - 생성자사용</h4>
    <c:set var="personVar1" value='<%= new Person("박문수", 50)%>' scope="request"/>

    <ul>
        <li>이름 : ${requestScope.personVar1.name}</li>
        <li>나이 : ${personVar1.age}</li>
    </ul>

    <h4>자바빈즈 생성 2 - target, property 사용</h4>
    <c:set var="personVar2" value="<%= new Person() %>" scope="request"/>
    <c:set target="${personVar2}" property="name" value="정약용"/>
    <c:set target="${personVar2}" property="age" value="60"/>

    <ul>
        <li>이름 : ${personVar2.name}</li>
        <li>나이 : ${requestScope.personVar2.age}</li>
    </ul>

</div>
</body>
</html>
