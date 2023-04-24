<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-24
  Time: 오전 9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>내장 객체 - Response</title>
</head>
<body>
<div class="container">
<%--    클라이언트에서 전송한 사용자 id, pw를 가져옴--%>
    <%
        String id = request.getParameter("user_id");
        String pwd = request.getParameter("user_pwd");

        // 현재 데이터베이스 연결 부분이 없기 때문에 단순 문자열 비교로 로그인 id, pw를 구분
        // equalsIgnoreCase() : 문자열 비교시 대소문자 구분하지 않음
        // sendRedirect(URL) : 지정한 웹페이지로 이동, 클라이언트에서 다시 지정한 페이지로 접속을 하는 것으로 데이터를 처리함,
        //                     현재 페이지에서 가지고 있던 request 정보를 공유하지 못함
        // getRequestDispatcher(URL) : 지정한 웹페이지로 이동, 서버에서 직접 지정한 페이지로 이동,
        //                             현재 페이지의 request 정보를 가지고 이동함(데이터를 공유)
        if (id.equalsIgnoreCase("must") && pwd.equalsIgnoreCase("1234")) {
            // ResponseWelcome.jsp 페이지로 이동
            response.sendRedirect("ResponseWelcome.jsp");
        } else {
            request.getRequestDispatcher("ResponseMain.jsp?loginErr=1").forward(request, response);
        }
    %>
</div>
</body>
</html>
