<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-24
  Time: 오전 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>내장객체 - response</title>
</head>
<body>
<div class="container">
  <h1>1. 로그인 폼</h1>
  <%
    String loginErr = request.getParameter("loginErr");
    if(loginErr != null){
      out.print("로그인 실패");
    }
  %>
  <form action="./ResponseLogin.jsp" method="post">
    아이디 : <input type="text" name="user_id"><br>
    패스워드 : <input type="text" name="user_pwd"/> <br>
    <input type="submit" value="로그인">

  </form>

  <h2> HTTP 응답헤더 설정하기</h2>
  <form action="./ResponseHeader.jsp" method="get">
    날짜 형식 : <input type="text" name="add_date" value="2021-10-25 09:00"/><br>
    숫자 형식 : <input type="text" name="add_int" value="8282"/><br>
    문자 형식 : <input type="text" name="str" value="홍길동"/><br>
    <input type="submit" value="응답 헤더 설정 & 클릭">

  </form>
</div>

</body>
</html>
