<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-10
  Time: 오후 1:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>JSTL - forTokens 예제</title>
</head>
<body>
<%-- 스크립틀릿을 사용하여 문자열 변수 생성 --%>

<%
    String rgba = "Red,Green,Blue,Black";
%>
<div class="container my-4">
    <h4>JSTL의 forTokens 태그 사용</h4>
<%-- jstl을 사용하여 스크립틀릿에서 생성한 변수를 호출--%>
<%-- forTokens를 사용하여 문자열을 분해하고 page 영역의 변수에 color에 저장--%>
<%-- forTokens를 사용 시 String 클래스와 split() 메소드를 사용하여 지정한 문자로 문자열을 분해하여 배열에 저장하는 부분과
    for문을 사용하여 출력하는 부분을 한번에 수행할 수 있음--%>
    <c:forTokens items="<%= rgba%>" delims="," var="color">
        <span style="color: ${color};">${color}</span><br>
    </c:forTokens>
</div>
</body>
</html>
