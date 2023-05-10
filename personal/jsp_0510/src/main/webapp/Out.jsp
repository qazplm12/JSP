<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-10
  Time: 오후 3:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>JSTL - out 예제</title>
</head>
<body>
<div class="container my-4">
<%-- jstl을 사용하여 page 영역의 변수에 iTag에 데이터 저장--%>
  <c:set var="iTag">
    i 태그는 <i>기울임</i>을 표현합니다.
  </c:set>

  <h4>기본 사용</h4>
<%-- jstl을 사용하여 page영역에 저장된 변수 iTag를 출력, escapeXml을 기본값을 true로 사용--%>
<%-- 입력되어 있는 내용을 그대로 데이터로 인식하여 출력--%>
  <c:out value="${iTag}"/>

  <h4>escapeXml 속성</h4>
<%-- jstl을 사용하여 page영역에 저장된 변수 iTag를 출력, escapeXml을 false로 사용--%>
<%-- 입력되어 있는 내용 중 특수기호의 기능을 사용해서 출력--%>
  <c:out value="${iTag}" escapeXml="false"/>

  <h4>default 속성</h4>
<%-- jstl을 사용하여 default 속성에 데이터 지정--%>
<%-- value 속성의 값이 null일 경우 default의 값을 출력함--%>
  <c:out value="${ param.name}" default="이름 없음"/>
  <c:out value="" default="빈 문자열도 값입니다."/>
</div>
</body>
</html>
