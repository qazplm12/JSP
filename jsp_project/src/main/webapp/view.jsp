<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-24
  Time: 오후 6:17
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
<c:import url="layout/header.jsp"/>
<%-- 비회원 게시물 조회 --%>
<div class="container">
    <div class="col-8 mx-auto">
        <%--        <p>${board.postNum}</p>--%>
        <form action="" class="form-control px-4 mb-2">
            <div class="mt-4">
                <a href="/list.do?category=${board.category}" class="text-decoration-none link-primary opacity-50">
                    <h5>${board.category}</h5></a>
                <div class="ms-2">
                    <h4 class="d-inline">${board.postTitle}</h4>
                </div>
                <div class="my-3 d-flex">
                    <div>
                        <img src="" alt="이미지">
                        <span class="d-inline">${board.postWriter}</span>
                    </div>
                    <div class="ms-auto">
                        <span>${board.postDate}</span>
                        <span class="text-muted">조회수</span>
                        <span class="text-muted">${board.postVisits}</span>
                    </div>
                </div>
            </div>
            <hr>
            <p class="py-4">${board.postContent}</p>
        </form>
            <%-- history.back() 쓰거나 페이징 넣을 시에 페이징 넘버 부여해서 링크 걸기 --%>
            <a href="" class="link-secondary opacity-75 text-decoration-none ms-2">목록보기</a>
    </div>
</div>


</body>
</html>
