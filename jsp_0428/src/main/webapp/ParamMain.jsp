<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-28
  Time: 오후 2:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    // 요청받은 페이지인 ParamMain.jsp에서 생성한 변수
  String pValue = "방랑시인";
%>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>액션태그 - param</title>
</head>
<body>
<div class="container my-4">
<%-- 액션태그 useBean으로 자바빈즈 생성, 생성한 자바빈즈의 데이터 영역을 request로 설정--%>
<%-- 액션태그의 include와 forward로 다시 요청한 페이지에서도 자바 빈즈를 공유--%>
  <jsp:useBean id="person" class="com.bitc.jsp_0428.Person" scope="request"/>

<%-- 액션태그 setProperty로 데이터 입력--%>
  <jsp:setProperty property="name" name="person" value="김삿갓"/>
  <jsp:setProperty property="age" name="person" value="56"/>

<%-- 액션태그 forward로 ParamForward.jsp로 이동 --%>
<%-- 이동 주소에 데이터를 추가하여 이동--%>
<%--  액션태그 param을 사용하여 매개변수를 추가로 전송함 --%>
  <jsp:forward page="ParamForward.jsp?param1=김병연">
      <jsp:param name="param2" value="경기도 양주"/>
      <jsp:param name="param3" value="<%= pValue%>"/>
  </jsp:forward>
</div>
</body>
</html>
