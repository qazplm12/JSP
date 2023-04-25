<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-25
  Time: 오전 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>쿠키설정</title>
</head>
<body>
<div class="container">
    <h2>1. 쿠키(cookie) 설정</h2>
    <%
        //Cookie 클래스 타입의 변수 선언과 동시에 객체 생성
        // 쿠키 객체 생성 시 쿠키 이름과 값을 설정
        Cookie cookie = new Cookie("myCookie", "쿠키맛나요"); // 쿠키 값 공백 XXXXXX
        cookie.setPath(request.getContextPath());
        cookie.setMaxAge(3600); // 쿠키가 유지될 시간, 쿠키 유지시간이 지나면 쿠키가 자동 삭제됨
        response.addCookie(cookie); // 클라이언트에 쿠키를 전송하기 위해서 response 내장 객체에 추가
    %>
    <h2>2. 쿠키 설정 직후 쿠키값 확인하기</h2>
    <%
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                String cookieName = c.getName();
                String cookieValue = c.getValue();
                out.println(String.format("%s : %s <br/>", cookieName, cookieValue)); // format() &s 뒤에 변수
            }
        }
    %>

    <h2>3. 페이지 이동 후 쿠키값 확인하기</h2>
    <a href="CookieResult.jsp">
        다음 페이지에서 쿠키값 확인하기
    </a>
</div>
</body>
</html>
