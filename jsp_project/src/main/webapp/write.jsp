<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-26
  Time: 오전 10:26
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
<script>
    if (<%=session.getAttribute("userName")%>) {
    }else{
        alert('잘못된 접근입니다.');
        location.href ="main.do";
    }
</script>
<div class="container">
    <div class="col-8 mx-auto">
        <form action="write.do" class="form-control px-4 mb-2" method="post">
            <input type="hidden" value="${sessionScope.get('userId')}" name="postWriter">
            <div class="input-group my-3">
                <label class="input-group-text" for="category">카테고리</label>
                <select class="form-select" id="category" name="category">
                    <option selected>category1</option>
                    <option>category2</option>
                    <option>category3</option>
                    <option>category4</option>

                    <%-- 카테고리 직접 추가 할 수 있을때. --%>
<%--                    <c:forEach var="item" items="${categories}">--%>
<%--                        <option>${item.category}</option>--%>
<%--                    </c:forEach>--%>
                </select>
            </div>
            <div class="form-floating my-3">
                <input type="text" id="title" name="postTitle" class="form-control" value="">
                <label for="title">제목</label>
            </div>
            <div class="form-floating my-3">
                <textarea style="height: 300px" class="form-control" id="content" name="postContent" wrap="hard" cols="30"></textarea>
                <label for="content" class="">내용</label>
            </div>
            <div class="d-flex justify-content-end my-2">
                <p>${requestScope.get("postNum")}</p>
                <button class="btn btn-primary fs-5" type="submit" id="writeBtn">작성</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
