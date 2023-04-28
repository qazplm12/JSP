<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-28
  Time: 오후 12:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String outerPath1 = "./OuterPage1.jsp";
    String outerPath2 = "./OuterPage2.jsp";

    pageContext.setAttribute("pAttr", "동명왕");
    request.setAttribute("rAttr", "온조왕");
%>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>액션태그 - include</title>
</head>
<body>
<div class="container my-4">
    <h2>지시어와 액션태그 동작 방식 비교</h2>

    <h3>지시어로 페이지 포함하기</h3>
<%-- 디렉티브 태그(지시어)인 include 사용 시 해당 파일을 현재 파일에 복사해서 사용--%>
<%-- 현재 파일에 모든 내용이 다 존재--%>
<%-- page, request 내장 객체와 각각의 페이지에서 선언한 변수도 함께 사용 가능--%>
    <%@include file="OuterPage1.jsp"%>
<%--@  include file="<%outerPath10uterPage1 %>" --%>
    <p>외부 파일에 선언한 변수 : <%=newVar1%></p>

    <h3>액션 태그로 페이지 포함하기</h3>
<%-- 액션 태그의 include 사용 시 해당파일로 이동 후 화면에 출력한 다음 다시 현재 파일로 돌아옴--%>
<%-- 현재 파일에는 출력된 결과물만 존재함--%>
<%-- page 내장 객체와 각각의 페이지에서 선언한 변수도 사용할 수 없음--%>
<%-- request 내장 객체는 함께 사용할 수 있음--%>
    <jsp:include page="./OuterPage2.jsp" />
    <jsp:include page="<%=outerPath2%>" />
    <p>외부 파일에 선언한 변수 : <%-- =newVar2 --%></p>
</div>

</body>
</html>
