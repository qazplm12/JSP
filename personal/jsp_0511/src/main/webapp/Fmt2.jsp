<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-11
  Time: 오전 9:15
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
<%-- jstl을 사용하여 Date클래스의 객체를 생성 후 page 영역의 변수 today에 저장--%>
<%-- 현재 시간을 기준으로 날짜 및 시간 정보를 저장함--%>
<c:set var="today" value="<%= new java.util.Date() %>"/>
<div class="container my-4">
  <h4>날짜 포맷</h4>
<%-- jstl을 사용하여 page영역에 저장된 날짜 정보를 불러와서 화면에 출력--%>
<%-- type 속성을 date으로 설정하여 날짜 정보만 출력--%>
  full : <fmt:formatDate value="${today}" type="date" dateStyle="full"/> <br>
  short : <fmt:formatDate value="${today}" type="date" dateStyle="short"/> <br>
  long : <fmt:formatDate value="${today}" type="date" dateStyle="long"/> <br>
  default : <fmt:formatDate value="${today}" type="date" dateStyle="default"/>

  <h4>시간 포맷</h4>
<%-- type 속성을 time으로 설정하여 시간 정보만 출력--%>
  full : <fmt:formatDate value="${today}" type="time" timeStyle="full"/> <br>
  short : <fmt:formatDate value="${today}" type="time" timeStyle="short"/> <br>
  long : <fmt:formatDate value="${today}" type="time" timeStyle="long"/> <br>
  default : <fmt:formatDate value="${today}" type="time" timeStyle="default"/>

  <h4>날짜/시간 표시</h4>
<%-- type 속성을 both으로 설정하여 날짜, 시간 정보 모두 출력--%>
  <fmt:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full"/> <br>
<%-- type 속성을 both으로 설정하여 날짜, 시간 정보 모두 출력, 출력 패턴을 사용자가 직접 지정--%>
<%-- y : 년도 표시, M : 월 표시, d : 일 표시, h : 시간 표시, m : 분 표시, s : 초 표시--%>
<%-- 패턴은 https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/text/SimpleDateFormat.html 참고--%>
  <fmt:formatDate value="${today}" type="both" pattern="yyyy-MM-dd a hh:mm:ss.SSS"/>

  <h4>타임존 설정</h4>
  <fmt:timeZone value="GMT">
    <fmt:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full"/> <br>
  </fmt:timeZone>

  <fmt:timeZone value="America/Chicago">
    <fmt:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full"/>
  </fmt:timeZone>
</div>
</body>
</html>
