<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-04
  Time: 오후 12:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>표현 언어 - 연산자</title>
</head>
<body>
<%
  int num1 = 3;
  pageContext.setAttribute("num2", 4);
  pageContext.setAttribute("num3", "5");
  pageContext.setAttribute("num4", "8");
%>
<div class="container my-4">
  <h3>변수 선언 및 할당</h3>
<%-- 표현 언어에서는 스크립틀릿에서 선언한 변수 사용 불가능--%>
  스크립틀릿에서 선언한 변수 : ${ num1 } <br>
  page 영역에 저장된 변수 : ${ num2 } <br>
  변수 할당 및 즉시 출력 : ${ num1 = 7 } <br>
  변수 할당 및 별도 출력 : ${ num2 = 8; '' } => ${ num2 } <br>
  num1 = ${num1}, num2 = ${num2}, num3 = ${num3}, num4 = ${num4}

  <h3>산술 연산자</h3>
  num1 + num2 : ${num1 + num2} <br>
  num1 - num2 : ${num1 - num2} <br>
  num1 * num2 : ${num1 * num2} <br>
  num3 / num4 : ${num3 / num4} <br>
  num3 div num4 : ${num3 div num4} <br>
  num3 % num4 : ${num3 % num4} <br>
  num3 mod num4 : ${num3 mod num4}

  <h3>+ 연산자는 덧셈만 가능</h3>
<%-- 기존 자바 문법에서는 문자열과 다른 타입을 연산 시 문자열 연결 연산자로 동작 --%>
<%-- 표현 언어에서는 타입변환이 자유롭기 때문에 아래의 연산이 정수끼리의 연산으로 동작 --%>
  num1 + "34" : ${num1 + "34"} <br>
  num2 + "이십" : \${num1 + "이십"} <br>
  "삼십" + "사십" : \${"삼십" + "사십"}

  <h3>비교 연산자</h3>
<%-- 기존의 자바 문법 비교 연산자 및 표현 언어의 비교 연산자 사용 가능 --%>
  num4 > num3 : ${num4 gt num3} <br>
  num1 < num3 : ${num1 lt num3} <br>
  num4 >= num4 : ${num2 ge num3} <br>
  num4 == num3 : ${num1 eq num4}

  <h3>논리 연산자</h3>
<%-- 기존의 자바 문법 논리 연산자 및 표현 언어의 논리 연산자 사용 가능 --%>
  num3 <= num4 && num3 == num4 : ${ num3 le num4 and num3 eq num4} <br>
  num3 >= num4 || num3 != num4 : ${ num3 ge num4 or num3 ne num4}
</div>
</body>
</html>
