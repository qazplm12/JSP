<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-24
  Time: 오전 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <title>Title</title>
</head>
<body>
<c:import url="layout/header.jsp"/>

<%-- boardList 가져오기 --%>
<main>
    <div class="container">
        <div class="col-10 mx-auto my-5">
            <div class="mb-5 border-bottom d-flex justify-content-between text-center">
                <h4 class="ms-2">최신 게시물 </h4>
                <a href="list.do" class="link-secondary text-decoration-none"><strong>더보기</strong></a>
            </div>
            <div class="row ms-4">
                <c:choose>
                    <c:when test="empty boardList">
                        <h1>등록된 게시물이 없습니다.</h1>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${boardList}" var="item" varStatus="loop" end="7">
                            <div class="col-3 my-4">
                                <a href="/view.do?postNum=${item.postNum}">
                                    <img src="resource/No-Image-Placeholder.svg.png" alt="이미지" width="200px" height=150px">
                                </a>
                                <p class="m-0">${item.postTitle}</p>
                                <span class="text-muted">작성자 ${item.postWriter}</span>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</main>
</body>
</html>
