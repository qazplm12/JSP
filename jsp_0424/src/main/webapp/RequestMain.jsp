<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-24
  Time: 오후 2:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@page import="com.bitc.jsp_0424.Person" %>
<%
    request.setAttribute("requestString", "request 영역의 문자열");
    request.setAttribute("requestPerson", new Person("안중근", 31));
%>

<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>내장 객체 범위 - request</title>
</head>
<body>
<h2> request 영역의 속성값 삭제하기</h2>
<%
    // request 내장 객체에 저장된 데이터 삭제
    request.removeAttribute("requestString");
    // request 내장 객체에 requestInteger 라는 이름의 데이터가 없기 때문에 삭제되지 않음 (오류 발생 X)
    request.removeAttribute("requestInteger");
%>
<h2>request 영역의 속성값 읽기</h2>
<%
    // request 내장 객체에 저장된 데이터 가져오기
    Person rPerson = (Person) (request.getAttribute("requestPerson"));
%>
<ul>
    <li>String 객체 : <%= request.getAttribute("requestString")%>
    </li>
    <li>Person 객체 : <%= rPerson.getName()%>, <%= rPerson.getAge()%>
    </li>
</ul>
<h2>포워드된 페이지에서 request 영역 속성값 읽기</h2>
<%
    // getRequestDispatcher > 지정한 페이지로 이동 //  .forward > 해당페이지로 가서 출력 후 다시 돌아옴
    // include와 다름
    request.getRequestDispatcher("RequestForward.jsp?paramHan=한글&paramEng=English").forward(request, response);
                                                // 매개 변수 전달 ? 뒤로 ( 파일명? 변수명1 = 값1 & 변수명2 = 값 ...)
%>
</body>
</html>
