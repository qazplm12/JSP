<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-24
  Time: 오후 3:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>내장 객체 범위 - session</title>
</head>
<body>
<div class="container">
<%-- SessionMain.jsp 를 거치지 않고 바로 오게되면 오류 발생 --%>
    <h2>페이지 이동 후 session 영역의 속성 읽기</h2>
    <%
        ArrayList<String> lists = (ArrayList < String >) session.getAttribute("lists");
                                // (문자열 형태로 사용하기 위해) (오브젝트 타입 -> ArrayList)
        for (String str : lists) {
            out.print(str + "<br>");
        }
    %>
</div>
</body>
</html>
