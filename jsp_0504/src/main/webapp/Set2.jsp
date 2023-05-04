<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-04
  Time: 오후 3:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.bitc.jsp_0504.Person" %>
<%@ page import="java.util.*" %>

<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>JSTL - set</title>
</head>
<body>
<div class="container my-4">
    <h4>List 컬렉션 이용하기</h4>
    <%
        ArrayList<Person> pList = new ArrayList<Person>();
        pList.add(new Person("성삼문", 55));
        pList.add(new Person("박팽년", 60));
    %>
    <c:set var="personList" value="<%= pList %>" scope="request"/>
    <ul>
        <li>이름 : ${requestScope.personList[0].name}</li>
        <li>나이 : ${personList[0].age}</li>
    </ul>

    <h4>Map 컬렉션 이용하기</h4>
    <%
        Map<String, Person> pMap = new HashMap<String, Person>();
        pMap.put("personArgs1", new Person("하위지", 65));
        pMap.put("personArgs2", new Person("이개", 67));
    %>
    <c:set var="personMap" value="<%= pMap%>" scope="request"/>
    <ul>
        <li>이름 : ${requestScope.personMap.personArgs2.name}</li>
        <li>나이 : ${personMap.personArgs2.age}</li>
    </ul>
</div>
</body>
</html>
