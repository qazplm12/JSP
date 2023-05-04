<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-04
  Time: 오후 3:00
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
<div class="container my-4">
    <h3>순수 JSP로 구구단 출력</h3>
    <table border="1">
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%
            for (int dan = 2; dan < 10; dan++) {
        %>
        <tr>
            <%
                for (int su = 1; su < 10; su++) {
            %>
            <td><%= dan%> * <%=su%> =  <%=dan * su %> &nbsp</td>
            <%
                }
            %>
        </tr>
        <%
            }
        %>
    </table>

    <br>
    <hr>
    <br>

    <h3>JSTL로 구구단 출력</h3>
    <table border="1">
        <c:forEach begin="2" end="9" var="dan">
        <tr>
            <c:forEach begin="1" end="9" var="su">
            <td>
                ${dan} * ${su} = ${dan*su} &nbsp
            </td>
            </c:forEach>
        </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
