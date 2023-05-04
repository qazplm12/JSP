<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-04
  Time: 오후 12:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@page import="java.util.ArrayList" %>

<%
  pageContext.setAttribute("num1", 9);
  pageContext.setAttribute("num2", "10");

  pageContext.setAttribute("nullStr", null);
  pageContext.setAttribute("emptyStr", "");
  // int 타입의 배열 생성, 크기가 0으로 생성
  pageContext.setAttribute("lengthZero", new Integer[0]);
  // ArrayList 생성, 데이터 입력 없음, size가 0임
  pageContext.setAttribute("sizeZero", new ArrayList());
%>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>표현 언어 - 연산자</title>
</head>
<body>
<div class="container my-4">
  <H3>empty 연산자</H3>
  empty nullStr : ${empty nullStr} <br>
  empty emptyStr : ${empty emptyStr} <br>
  empty lengthZero : ${empty lengthZero} <br>
  empty sizeZero : ${empty sizeZero}

  <h3>삼항 연산자</h3>
  mum1 gt num2 ? "참" : "거짓" = > ${mum1 gt num2 ? "num1이 크다" : "num2가 크다"}

  <h3>null 연산</h3>
<%-- 기본 자바 문법에서는 null과 연산 시 오류--%>
<%-- JSP의 표현 언어에서는 null을 으로 인식--%>
  null + 10 : ${ null + 10} <br>
  nullStr + 10 : ${ nullStr + 10} <br>
  param.noVar > 10 : ${ param.noVar > 10}

</div>
</body>
</html>
