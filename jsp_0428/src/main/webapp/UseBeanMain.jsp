<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-28
  Time: 오후 12:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.bitc.jsp_0428.Person" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>액션태그 - useBean </title>
</head>
<body>
<div class="container my-4">
    <h2>useBean 액션 태그</h2>
    <h3>자바빈즈 생성하기</h3>
    <jsp:useBean id="person" class="com.bitc.jsp_0428.Person" scope="request"/>

    <h3>setProperty 액션 태그로 자바빈즈 속성 지정하기</h3>
    <jsp:setProperty name="person" property="name" value="임꺽정"/>
    <jsp:setProperty name="person" property="age" value="41"/>

    <h3>getProperty 액션 태그로 자바빈즈 속성 읽기</h3>
    <ul>
        <li><jsp:getProperty name="person" property="name"/></li>
        <li><jsp:getProperty name="person" property="age"/></li>
    </ul>

    <hr>
    <br>
    <hr>

    <h3>useBean 미사용 시</h3>
    <%
        Person person1 = new Person();
        person1.setName("홍길동");
        person1.setAge(25);
    %>
    <ul>
        <li><%= person1.getName()%></li>
        <li><%= person1.getAge()%></li>
    </ul>

</div>
</body>
</html>
