<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-10
  Time: 오후 3:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>JSTL - fmt 예제</title>
</head>
<body>
<div class="container my-4">
  <h4>숫자 포맷 설정</h4>
  <c:set var="number1" value="12345"/>
  콤마 O : <fmt:formatNumber value="${number1}"/> <br>
  콤마 X : <fmt:formatNumber value="${number1}" groupingUsed="false"/> <br>
  <fmt:formatNumber value="${number1}" type="currency" var="printNum1"/>
  통화기호 : ${printNum1} <br>
  <fmt:formatNumber value="0.03" type="percent" var="printNum2"/>
  퍼센트 : ${ printNum2}

  <h4>문자열을 숫자로 변경</h4>
  <c:set var="number2" value="6,789.01"/>
  <fmt:parseNumber value="${number2}" pattern="00,000.00" var="printNum3"/>
  소수점까지 : ${printNum3}<br>
  <fmt:parseNumber value="${number2}" integerOnly="true" var="printNum4"/>
  정수 부분만 : ${printNum4}
</div>
</body>
</html>
