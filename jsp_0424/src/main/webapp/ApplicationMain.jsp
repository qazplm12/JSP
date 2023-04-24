<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-24
  Time: 오전 11:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>내부 객체 - Application</title>
</head>
<body>
<div class="container">
    <h2>web.xml 에 설정한 내용 읽어오기</h2>
    초기화 매개변수 1 : <%= application.getInitParameter("INIT_PARAM")%><br>
    초기화 매개변수 2 : <%= application.getInitParameter("TEST1")%>

    <h2>서버의 물리적 경로 얻어오기</h2>
    application 내장 객체 : <%= application.getRealPath("./")%>

    <h2>선언부에서 application 내장 객체 사용하기</h2>
    <%!
        public String useImplicitObject() {
            return this.getServletContext().getRealPath("./");
        }

        public String useImplicitObject(ServletContext app) {
            return app.getRealPath("./");
        }
    %>

    <ul>
        <li>this 사용 : <%= useImplicitObject()%></li>
        <li>내장 객체를 인수로 전달 : <%= useImplicitObject(application) %></li>
    </ul>
</div>
</body>
</html>
