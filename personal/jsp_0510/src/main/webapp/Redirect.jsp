<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-10
  Time: 오후 2:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>JSTL - redirect 예제</title>
</head>
<body>
<%-- jstl을 사용하여 request 영역에 데이터 저장--%>
<c:set var="requestVar" value="MustHave" scope="request"/>
<%-- jstl을 사용하여 OtherPage.jsp로 리다이렉트 실행--%>
<c:redirect url="/OtherPage.jsp">
<%-- 매개변수로 2개의 데이터를 전달함--%>
  <c:param name="user_param1" value="출판사"/>
  <c:param name="user_param2" value="골든래빗"/>
</c:redirect>
</body>
</html>
