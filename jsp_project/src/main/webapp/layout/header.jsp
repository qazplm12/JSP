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
<c:set var="userId" value="${sessionScope.get('userId')}"/>
<c:set var="userEmail" value="${sessionScope.get('userEmail')}"/>

<header>
    <div class="offcanvas offcanvas-start bg-secondary" id="mySideMenu">
        <div class="offcanvas-header">
            <h1 class="offcanvas-title ms-3" style="text-decoration: underline"><i>.log</i></h1>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
        </div>
        <div class="offcanvas-body p-5">

            <%-- 카테고리 리스트--%>
            <h2><a href="/list.do" class="my-4 link-light  text-decoration-none">모든 게시물</a></h2>
            <ul class="list-unstyled">
                <li class="my-3"><a href="/list.do?category=category1" class="text-decoration-none link-light "><h3>
                    category1</h3></a></li>
                <li class="my-3"><a href="/list.do?category=category2" class="text-decoration-none link-light "><h3>
                    category2</h3></a></li>
                <li class="my-3"><a href="/list.do?category=category3" class="text-decoration-none link-light "><h3>
                    category3</h3></a></li>
                <li class="my-3"><a href="/list.do?category=category4" class="text-decoration-none link-light "><h3>
                    category4</h3></a></li>
                <%-- 카테고리 편집 기능 필요--%>
                <%--                <c:forEach items="${categories}" var="item" varStatus="loop">--%>
                <%--                    <li><a href="/list.do?category=${item.category}">${item.category}</a></li>--%>
                <%--                </c:forEach>--%>
            </ul>
        </div>
    </div>

    <nav class="navbar navbar-expand-md bg-black navbar-black">
        <%-- 햄버거 버튼 --%>
        <button type="button" class="navbar-brand ms-3 btn btn-black" data-bs-toggle="offcanvas"
                data-bs-target="#mySideMenu">
            <i class="bi bi-list text-white fs-3 bg-black"></i>
        </button>

        <%-- 가운데로 정렬--%>

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
                    <p class="text-muted my-auto"><%=session.getAttribute("userName")%> 님</p>
                    <li class="nav-item d-flex ">
                        <a href="#" class="nav-link"><i class="fs-3 bi bi-person-circle text-white"></i></a>
                        <div class="dropdown my-auto me-3">
                            <button class="btn btn-dark btn-sm dropdown-toggle" href="#" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false"></button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="myPage.jsp?userId=${sessionScope.get('userId')}">내 정보 보기</a></li>
                                <c:choose>
                                <c:when test="${sessionScope.get('grade') >= 1}">
                                <li><a class="dropdown-item" href="/memberList.do">관리자 메뉴</a></li>
                                </c:when>
                                    <c:otherwise>

                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </div>
                    </li>
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
        <div class="my-4 text-center">
            <h1 class="mx-auto"><a href="main.do" class="text-black link-secondary"><i>.log</i></a></h1>
        </div>
    </div>

</header>