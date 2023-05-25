<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yeahc
  Date: 2023-05-26
  Time: 오전 2:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
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
<%--         <p>${board.postNum}</p>--%>
        <form action="write.do" class="form-control px-4 mb-2" method="post">
            <input type="hidden" value="${board.postNum}" name="postNum">
            <div class="input-group my-3">
                <label class="input-group-text" for="category">카테고리</label>
                <select class="form-select" id="category" name="category">
                    <option selected>${board.category}</option>
                    <c:forEach var="item" items="${categories}">
                        <option>${item.category}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-floating my-3">
                <input type="text" id="title" name="postTitle" class="form-control" value="${board.postTitle}">
                <label for="title">제목</label>
            </div>
            <div class="form-floating my-3">
                <textarea style="height: 300px" class="form-control" id="content" name="postContent">${board.postContent}</textarea>
                <label for="content" class="">내용</label>
            </div>
            <div class="d-flex justify-content-end my-2">
                <button class="btn btn-primary fs-5" type="submit">수정</button>
            </div>
        </form>
    </div>
    <%-- history.back() 쓰거나 페이징 넣을 시에 페이징 넘버 부여해서 링크 걸기 --%>
</div>
</body>
</html>
