<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-27
  Time: 오후 4:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>세션 사용하기</title>
</head>
<body>
<div class="container">
    <%
        String userId = "";
        String userPw = "";

        // getAttribute()로 데이터를 가져왔는데 데이터가 null일 경우 지정한 이름으로 세션에 저장된 데이터가 없음
        if (session.getAttribute("userId") != null) {
        // 세션에 저장된 데이터는 모두 Object 타입이므로 타입 변환이 필요함
            userId = session.getAttribute("userId").toString();
            userPw = session.getAttribute("userPw").toString();
        }

    %>

    <h2>세션 확인 페이지</h2>
    <p><%= userId %>님 반갑습니다.</p>
    <p>당신의 비밀번호는<%= userPw %>입니다.</p>

    <a href="./LoginForm.jsp" target="_self" class="btn btn-info">되돌아가기</a>

</div>
</body>
</html>
