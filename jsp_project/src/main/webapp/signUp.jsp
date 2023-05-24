<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-24
  Time: 오후 4:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>


<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Title</title>
</head>
<body>
<div class="container">
    <div class="col-5 mx-auto mt-5 pt-5">
        <form action="" class="form-control">
            <h2 class="p-2"><a href="main.do">.log</a></h2>
            <h2 class="text-center my-4">회원가입</h2>
            <div class="input-group my-4 ">
                <input type="text" class="form-control py-3" placeholder="아이디" aria-describedby="button-addon2">
                <button class="btn btn-outline-secondary" type="button" id="button-addon2">중복 확인</button>
                <%-- 아이디 중복 시 빨간색 경고 p태그 추가 & submit 버튼 disabled --%>
            </div>
            <div class="form-floating my-4">
                <input type="text" class="form-control" id="name" value="홍길동">
                <label for="name">이름</label>
            </div>

            <div class="form-floating my-4">
                <input type="email" class="form-control" id="email" value="full505@naver.com">
                <label for="email">이메일 주소</label>
            </div>

            <div class="py-3"></div>

            <div class="form-floating my-4">
                <input type="password" class="form-control" id="pwInput" value="">
                <label for="pwInput">비밀번호</label>
            </div>
            <div class="form-floating my-4">
                <input type="password" class="form-control" id="pwInputMatch" value="">
                <label for="pwInputMatch">비밀번호 확인</label>
            </div>
            <%-- 비밀번호 다를 시 빨간 경고 텍스트 & submit 버튼 disabled --%>
            <p id="textBox" class="text-danger"></p>

            <div class="my-3 d-grid gap-3">
                <button type="submit" class="btn btn-primary" id="btn-submit">회원가입</button>
            </div>
        </form>
    </div>
</div>

</body>
<%-- 비밀번호 다를 시 빨간 경고 텍스트 & submit 버튼 disabled --%>
<script>
    let input = document.getElementById("pwInput");
    let textBox = document.getElementById("textBox");
    const btn = document.getElementById("btn-submit")
    let value = "";


    input.addEventListener("input", function () {
        value = input.value;
    });

    let inputMatch = document.getElementById("pwInputMatch");
    inputMatch.addEventListener("input", function () {
        let valueMatch = inputMatch.value;
        if (value !== valueMatch) {
            textBox.textContent = "입력한 비밀번호가 다릅니다.";
            btn.disabled = true;
        } else {
            textBox.textContent = "";
            btn.disabled = false;
        }
    });

</script>
</html>
