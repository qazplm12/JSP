<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-28
  Time: 오후 2:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>액션태그 - UseBean</title>
</head>
<body>
<div class="container my-4">

    <h3>액션 태그로 폼값 한번에 받기</h3>
    <%-- 액션태그 useBean을 사용하여 자바빈즈 생성 --%>
    <jsp:useBean id="person" class="com.bitc.jsp_0428.Person"/>
    <%-- property 에 * 사용 시 해당 자바빈즈의 모든 속성을 가르킴--%>
    <%-- 클라이언트에서 전송된 데이터의 이름과 setProperty의 property의 이름이 같을 경우
        getParameter 없이 자바빈즈에 바로 저장할 수 있음 --%>
    <jsp:setProperty property="*" name="person"/>

    <ul>
        <li>이름 :
            <jsp:getProperty name="person" property="name"/>
        </li>
        <li>나이 :
            <jsp:getProperty name="person" property="age"/>
        </li>
    </ul>
</div>
</body>
</html>
