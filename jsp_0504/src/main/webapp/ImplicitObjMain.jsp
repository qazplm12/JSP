<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-04
  Time: 오전 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
  pageContext.setAttribute("scopeValue", "페이지 영역");
  request.setAttribute("scopeValue", "리퀘스트 영역");
  session.setAttribute("scopeValue", "세션 영역");
  application.setAttribute("scopeValue", "애플리케이션 영역");
%>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>표현 언어 - 내장 객체</title>
</head>
<body>
<div class="container my-4">
  <h2>ImplicitObjMain 페이지</h2>
  <h3>각 영역에 저장된 속성 읽기</h3>

  <ul>
<%-- 표현 언어로 내장객체 접근시 Scope 라는 단어 추가됨--%>
    <li>페이지 영역 : ${pageScope.scopeValue}</li>
    <li>리퀘스트 영역 : ${requestScope.scopeValue}</li>
    <li>세션 영역 : ${sessionScope.scopeValue}</li>
    <li>애플리케이션 영역 : ${applicationScope.scopeValue}</li>
  </ul>

  <h3>영역 지정 없이 속성 읽기</h3>
  <ul>
<%-- 영역 지정없이 속성을 읽어오면 페이지 영역의 속성을 가져옴 --%>
<%-- 비어있으면 리퀘스트 영역의 속성을 가져온다 --%>
    <li>${scopeValue}</li>
  </ul>

<%-- 액션 태그의 Forward--%>
  <jsp:forward page="ImplicitForwardResult.jsp"></jsp:forward>
</div>
</body>
</html>
