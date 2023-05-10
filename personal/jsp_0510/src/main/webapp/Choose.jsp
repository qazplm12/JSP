<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-10
  Time: 오전 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>JSTL - choose 예제</title>
</head>
<body>
<%-- jstl을 사용하여 변수 number에 정수 100 저장, page 영역에 저장 --%>
<c:set var="number" value="100"/>
<div class="container my-4">
    <h4>choose 태그로 홀짝 판단하기</h4>
    <%-- jstl의 choose, when, otherwise를 사용하여 if ~ else 문을 구현 --%>
    <c:choose>
        <c:when test="${ number mod 2 eq 0}">
            ${number}는 짝수입니다.
        </c:when>
        <c:otherwise>
            ${number}는 홀수입니다.
        </c:otherwise>
    </c:choose>

    <h4>국, 영, 수 점수를 입력하면 평균을 내어 학점 출력</h4>
    <%-- form 태그 사용시 action 속성을 지정하지 않으면 현재 페이지로 접속--%>
    <form class="form-control">
        국어 : <input type="text" name="kor" class="form-control"/> <br>
        영어 : <input type="text" name="eng" class="form-control"/> <br>
        수학 : <input type="text" name="math" class="form-control"/> <br>
        <input type="submit" value="학점 구하기" class="btn btn-secondary">
    </form>
    <%-- jstl의 if문을 사용하여 데이터가 있으면 화면 출력 --%>
    <%-- EL의 param을 사용하여 전달된 데이터 가져오기, empty로 데이터 확인 및 or 연산 --%>
    <%-- empty : 해당 변수가 비었는지 확인하는 EL의 명령어--%>
    <%-- param : getParameter()와 동일한 역할을 하는 EL의 명령어 --%>
    <c:if test="${not(empty param.kor or empty param.eng or empty param.math)}">
        <%-- jstl을 사용하여 전달된 데이터를 jstl을 사용하여 연산 후 page영역의 변수 avg에 저장 --%>
        <c:set var="avg" value="${(param.kor + param.eng + param.math) / 3}"/>
        평균 점수는 ${avg} 으로

        <%-- jstl의 choose, when, otherwise를 통해서 if ~ else if ~ else 문을 구현--%>
        <c:choose>
            <c:when test="${ avg >= 90}"> A 학점</c:when>
            <c:when test="${ avg >= 80}"> B 학점</c:when>
            <c:when test="${ avg ge 70}"> C 학점</c:when>
            <c:when test="${ avg ge 60}"> D 학점</c:when>
            <c:otherwise>F 학점</c:otherwise>
        </c:choose>
        입니다.
    </c:if>
</div>

</body>
</html>
</jsp:root>