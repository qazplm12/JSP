<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-18
  Time: 오전 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 스크립틀릿을 사용하여 가져오기--%>
<%--<%--%>
<%--    String pageName = request.getParameter("pageName");--%>
<%--    String result = "";--%>

<%--    if (pageName.equals("listPage")) {--%>
<%--        result = "게시물 목록 페이지";--%>
<%--    } else if (pageName.equals("writePage")) {--%>
<%--        result = "게시물 등록 페이지";--%>
<%--    } else if (pageName.equals("viewPage")) {--%>
<%--        result = "게시물 상세 페이지";--%>
<%--    } else if (pageName.equals("confirmedPage")) {--%>
<%--        result = "게시물 비밀번호 확인 페이지";--%>
<%--    } else if (pageName.equals("editPage")) {--%>
<%--        result = "게시물 수정 페이지";--%>
<%--    }--%>
<%--%>--%>

<%-- EL 언어 사용하여 가져오기 --%>
<header class=" py-5 border-bottom bg-secondary bg-opacity-10">
    <div class="container text-center">
        <h1 class="display-2">MVC2 방식게시판</h1>
<%--        <h2><%=result%></h2>--%>
        <c:choose>
            <c:when test="${param.pageName == 'listPage'}">
                <h2>게시물 목록 페이지</h2>
            </c:when>
            <c:when test="${param.pageName == 'writePage'}">
                <h2>게시물 등록 페이지</h2>
            </c:when>
            <c:when test="${param.pageName == 'viewPage'}">
                <h2>게시물 상세 페이지</h2>
            </c:when>
            <c:when test="${param.pageName == 'confirmedPage'}">
                <h2>게시물 비밀번호 확인 페이지</h2>
            </c:when>
            <c:when test="${param.pageName == 'editPage'}">
                <h2>게시물 수정 페이지</h2>
            </c:when>
            <c:when test="${param.pageName == 'listPage'}">
                <h2>게시물 목록 페이지</h2>
            </c:when>
        </c:choose>

    </div>
</header>
