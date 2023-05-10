<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-10
  Time: 오후 2:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Title</title>
</head>
<body>
<%--jstl을 사용하여 request 영역에 데이터 저장--%>

<c:set var="requestVar" value="MustHave" scope="request"/>
<%--jstl의 import 액션태그의 include와 동하 기능 --%>
<%-- param 태그를 사용하여 매개변수를 imfort할 페이지로 전달할 수 있음--%>
<%-- import할 페이지를 page 영역의변수 contents에 저장--%>
<c:import url="OtherPage.jsp" var="contents">
    <c:param name="user_param1" value="JSP"/>
    <c:param name="user_param2" value="기본서"/>
</c:import>
<div class="container my-4">
<%-- page 영역에 저장된 외부 페이지를 불러옴 --%>
    <h4>다른 문서 삽입하기</h4>
    ${contents}

    <h4>외부 자원 삽입하기</h4>
    <IFRAME src="/GoldPage.jsp" style="width:100%; height:600px;"></IFRAME>
</div>
</body>
</html>
