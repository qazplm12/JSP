<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-24
  Time: 오전 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Title</title>
</head>
<body>
<c:import url="layout/header.jsp"/>
<main class="container my-5">
    <div class="my-4 text-center">
        <h2>${category}</h2>
    </div>
    <table class="table text-center">
        <colgroup>
            <col style="width: 15%"/>
            <col style="width: 50%"/>
            <col style="width: 25%"/>
            <col style="width: 10%"/>
        </colgroup>
        <thead class="text-center">
        <th>작성일</th>
        <th>제목</th>
        <th>작성자</th>
        <th>조회수</th>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="empty boardList">
                <tr>
                    <td colspan="4">등록된 게시물이 없습니다.</td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach items="${boardList}" var="item" varStatus="loop">
                    <tr class="fs-4">
                        <td class="py-4">${item.postDate}
                        <%-- 최신 게시물 표시 --%>
                        <%-- <c:set var="today" value="<%= new java.util.Date() %>"/>--%>
                        <%-- <fmt:formatDate value="${today}" pattern="MM-dd (HH:mm)" var="now"/>--%>
                        <%-- <span></span>--%>
                        </td>
                        <td class="py-4"><a href="${item.postIdx}">${item.postTitle}</a>
                        </td>
                        <td class="py-4">${item.postWriter}</td>
                        <td class="py-4">${item.postVisits}</td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>
</main>
</body>
</html>
