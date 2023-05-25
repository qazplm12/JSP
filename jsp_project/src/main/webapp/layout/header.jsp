<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-24
  Time: 오후 4:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 세션정보 받아오기 --%>
<c:set var="userName" value="${sessionScope.get('userName')}"/>
<c:set var="failed" value="${sessionScope.get('failed')}%>"/>
<script>
    if (<%=session.getAttribute("failed")%>) {
        alert('로그인 실패!');
        <%
            session.setAttribute("failed", false);
        %>
    }
</script>
<header>
    <div class="offcanvas offcanvas-start" id="mySideMenu">
        <div class="offcanvas-header">
            <h1 class="offcanvas-title" style="text-decoration: underline">.log</h1>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
        </div>
        <div class="offcanvas-body">

            <%-- 카테고리 리스트--%>
            <h2><a href="/list.do">모든 게시물</a></h2>
            <c:forEach items="${categories}" var="item" varStatus="loop">
                <h2><a href="/list.do?category=${item.category}">${item.category}</a></h2>
            </c:forEach>
        </div>
    </div>

    <nav class="navbar navbar-expand-md bg-dark navbar-dark">
        <%-- 햄버거 버튼 --%>
        <button type="button" class="navbar-brand ms-3" data-bs-toggle="offcanvas" data-bs-target="#mySideMenu">
            <img src="" alt="asd">
        </button>

        <%-- 가운데로 정렬--%>
        <h2 class="mx-auto"><a href="main.do">.log</a></h2>
        <ul class="navbar-nav ms-auto me-4">
            <c:choose>
                <c:when test="${empty userName}">
                    <button type="button" id="login-btn" class="btn btn-dark" data-bs-toggle="modal"
                            data-bs-target="#modal-login">로그인
                    </button>
                </c:when>
                <c:otherwise>
                    <c:set var="failed" value="${false}"/>
                    <%-- 로그인 시 인사말, 유저 이미지 --%>
                    <span class="text-muted"><%=session.getAttribute("userName")%>님</span>
                    <li class="nav-item"><a href="#" class="nav-link"><img src="" alt="이미지"></a></li>
                    <%-- 로그인시 로그아웃 버튼--%>
                    <li class="nav-item">
                        <button type="button" id="logout-btn" class="btn btn-dark">로그아웃</button>
                    </li>
                </c:otherwise>
            </c:choose>
            <%-- 로그아웃 --%>
            <script>
                const logout = document.getElementById("logout-btn");
                logout.addEventListener("click", function () {
                    alert('로그아웃 되었습니다.');
                    location.href = "/logout.do";
                });
            </script>

            <%-- 로그인 창--%>
            <div class="modal fade" id="modal-login">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="d-flex justify-content-end">
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <h2 class="modal-title text-center my-4">로그인</h2>
                            <%-- 로 전송 --%>
                            <form action="/login.do" class="form-control" method="post">
                                <input type="hidden" value="${pageContext.request.requestURL}" name="from">
                                <input type="hidden" value="${pageContext.request.queryString}" name="queryStr">
                                <div class="my-3 p-2">
                                    <label for="user-id" class="form-label">아이디</label>
                                    <input type="text" class="form-control" id="user-id" name="userId">
                                </div>
                                <div class="my-3 p-2">
                                    <label for="user-pw" class="form-label">비밀번호</label>
                                    <input type="password" class="form-control" id="user-pw" name="userPw">
                                </div>
                                <div class="my-4 d-grid gap-3">
                                    <button type="submit" class="btn btn-primary">로그인</button>
                                    <a href="signUp.jsp" class="btn btn-secondary">회원가입</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </ul>
    </nav>

    <%-- 페이지 안내 텍스트 --%>
    <div>
        <h1 class="my-4 text-center">메인 페이지</h1>
    </div>

</header>