<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-24
  Time: 오후 6:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>


<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:scriptlet>
    pageContext.setAttribute("cr", "\r");
    pageContext.setAttribute("lf", "\n");
    pageContext.setAttribute("crlf", "\r\n");
</jsp:scriptlet>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <title>Title</title>
</head>
<body>
<c:import url="layout/header.jsp"/>
<div class="container">
    <div class="col-8 mx-auto">
        <form action="edit.do" class="form-control px-4 mb-2">
            <input type="hidden" value="${board.postNum}" name="postNum">
            <div class="mt-4">
                <a href="/list.do?category=${board.category}" class="text-decoration-none link-primary opacity-50">
                    <h5>${board.category}</h5></a>
                <div class="ms-2">
                    <h4 class="d-inline">${board.postTitle}</h4>
                </div>
                <div class="my-3 d-flex">
                    <div class="ms-2">
                        <i class="fs-3 bi bi-person-circle"></i>
                        <span class="d-inline my-auto">${board.postWriter}</span>
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
<%--            ${fn:replace(, , ) }--%>
            <div class="border-top py-3 d-flex justify-content-end">
                <c:choose>
                    <c:when test="${board.postWriter eq sessionScope.get('userId')}">
                        <button type="submit" class="btn btn-primary opacity-75">수정</button>
                        <button type="button" class="btn btn-danger opacity-75 mx-2" id="del-btn">삭제</button>
                    </c:when>
                    <c:when test="${sessionScope.get('grade') >= 1}">
                        <button type="button" class="btn btn-danger opacity-75 mx-2" id="del-btn">삭제</button>
                    </c:when>
                    <c:otherwise>
                    </c:otherwise>
                </c:choose>
            </div>
        </form>
        <%-- history.back() 쓰거나 페이징 넣을 시에 페이징 넘버 부여해서 링크 걸기 --%>
        <a href="list.do" class="link-secondary text-decoration-none ms-2">목록보기</a>

        <%-- 댓글 --%>
        <div>
            <div class="mt-4">
                <h4>댓글</h4>
            </div>


            <form action="addPC.do" method="post">
                <div class="input-group my-3">
                    <input type="hidden" name="postNum" value="${board.postNum}">
                    <c:choose>
                        <c:when test="${not empty sessionScope.get('userName')}">
                            <textarea class="form-control" aria-describedby="postComment" name="PCContent" wrap="hard" cols="30"></textarea>
                            <button class="btn btn-outline-secondary" type="submit" id="postComment">작성</button>
                        </c:when>
                        <c:otherwise>
                            <textarea class="form-control" aria-describedby="postComment" placeholder="로그인 이후 이용가능합니다." disabled></textarea>
                            <button class="btn btn-outline-secondary" type="submit" id="postComment" disabled>작성
                            </button>
                        </c:otherwise>
                    </c:choose>

                </div>
            </form>
        </div>
        <div class="col-10 mt-5 ms-4">
            <c:forEach var="item" items="${commentList}" varStatus="loop">
                <form action="deletePC.do" class="form-control bg-light" method="get">
                    <input type="hidden" value="${board.postNum}" name="postNum">
                    <input type="hidden" value="${item.commentDate}" name="commentDate">
                    <input type="hidden" value="${item.commentId}" name="commentId">
                    <c:choose>
                        <c:when test="${sessionScope.get('userId') eq item.commentId}">
                            <div class="d-flex justify-content-end">
                                <button type="submit" class="btn-close ms-auto"></button>
                            </div>
                        </c:when>
                        <c:otherwise></c:otherwise>
                    </c:choose>
                    <div class="bg-light px-3">
                        <p><span class="fs-5">${item.commentId}</span>(<span
                                class="text-muted">${item.commentDate}</span>)</p>
                        <p>${item.commentContent}</p>
                    </div>
                </form>
            </c:forEach>
        </div>
    </div>
</div>
<script>
    const del_btn = document.getElementById("del-btn");
    del_btn.addEventListener("click", function () {
        if (confirm("정말 삭제 하시겠습니까?")) {
            location.href = "/delete.do?postNum=${board.postNum}&postId=${board.postWriter}";
        }
    });
</script>

</body>
</html>
