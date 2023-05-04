<%@ page import="java.util.Date" %>
<%-- 자바빈즈 사용하기 위해 클래스 가져오기--%>
<%@ page import="com.bitc.jsp_0504.Person" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-04
  Time: 오후 3:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%-- jstl을 사용하기 위해서 태그 라이브러리 등록--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>JSTL - set</title>
</head>
<body>
<div class="container my-4">
<%-- jstl을 사용하여 기본 내장 객체인 page에 저장--%>
<%-- jstl을 사용하여 변수 directVar을 선언하고 정수 100을 저장--%>
    <c:set var="directVar" value="100"/>
<%-- jstl을 사용하여 변수 elVar을 선언하고 el언어를 사용하여 기존 생성한 변수 directVar을 가져와서 연산 후 저장--%>
    <c:set var="elVar" value="${directVar mod 5}"/>
<%-- jstl을 사용하여 변수 expVar을 선언하고 jsp의 표현식(<%=%>) 사용하여 객체 생성--%>
    <c:set var="expVar" value="<%= new Date()%>"/>
<%-- jstl을 사용하여 변수 betweenVar을 선언하고 시작 태그와 끝 태그 사이에 데이터를 입력하여 저장--%>
    <c:set var="betweenVar">변수값 요렇게 설정</c:set>

    <h4>EL을 이용해 변수 출력</h4>
    <ul>
<%-- jstl을 사용하여 내장 객체에 저장된 변수 값을 출력 --%>
        <li>directVar : ${pageScope.directVar}</li>
<%-- jstl을 사용하여 내장 객체(page 영역)에 저장된 변수 값을 출력, 영역지정이 없으면 기본 영역의 변수 출력--%>
        <li>elVar : ${elVar}</li>
        <li>expVar : ${expVar}</li>
        <li>betweenVar : ${betweenVar}</li>
    </ul>

    <h4>자바빈즈 생성 1 - 생성자사용</h4>
<%-- jstl을 사용 하여 자바빈즈 변수 생성, value 속성에서 jsp 표현식으로 자바 객체를 생성, request 영역에 저장--%>
    <c:set var="personVar1" value='<%= new Person("박문수", 50)%>' scope="request"/>

    <ul>
<%-- jstl을 사용하여 생성한 자바빈즈 personVar1의 필드 name 출력 --%>
        <li>이름 : ${requestScope.personVar1.name}</li>
        <li>나이 : ${personVar1.age}</li>
    </ul>

    <h4>자바빈즈 생성 2 - target, property 사용</h4>
<%-- jstl을 사용하여 자바빈즈 변수 생성--%>
    <c:set var="personVar2" value="<%= new Person() %>" scope="request"/>
<%-- jstl을 사용하여 생성된 자바빈즈를 target 속성으로 설정하고, property, value로 데이터를 입력--%>
    <c:set target="${personVar2}" property="name" value="정약용"/>
    <c:set target="${personVar2}" property="age" value="60"/>

    <ul>
        <li>이름 : ${personVar2.name}</li>
        <li>나이 : ${requestScope.personVar2.age}</li>
    </ul>

</div>
</body>
</html>
