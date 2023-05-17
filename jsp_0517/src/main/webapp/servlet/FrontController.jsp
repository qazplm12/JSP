<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-17
  Time: 오전 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>한번의 매핑으로 여러가지 요청 처리</title>
</head>
<body>
<div class="container my-4">
    <h3>한 번의 매핑으로 여러가지 요청 처리하기</h3>
<%-- el언어를 사용하여 내용물이 없을 경우 표시 안함--%>
    ${resultValue}
    <ol>
        <li>URI : ${uri}</li>
        <li>요청명 : ${commandStr}</li>
    </ol>
    <ul>
<%-- a 태그를 사용한 페이지 이동은 get 방식임 --%>
        <li><a href="/servlet/regist.one">회원가입</a></li>
        <li><a href="/servlet/login.one">로그인</a></li>
        <li><a href="/servlet/freeboard.one">자유게시판</a></li>
    </ul>

    <h4>여러가지의 요청을 여러개의 servlet으로 처리</h4>
    <ul>
        <li><a href="/servlet/Regist.two">회원가입</a></li>
        <li><a href="/servlet/Login.two">로그인</a></li>
        <li><a href="/servlet/Freeboard.two">자유게시판</a></li>
    </ul>
</div>
</body>
</html>
