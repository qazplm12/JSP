<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-17
  Time: 오후 3:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Title</title>
</head>
<body>
<%--<jsp:include page="/layout/header.jsp"/>  액션태그의 include로 페이지 불러오기 --%>

<%-- jstl의 import로 페이지 불러오기, parameter 전달--%>
<c:import url="/layout/header.jsp">
    <c:param name="pageName" value="listPage" ></c:param>
</c:import>
<main class="container my-4 py-4">
    <div class="my-3">
        <table class="table table-hover table-striped text-center">
            <colgroup>
                <col style="width: 5%"/>
                <col style="width: 50%"/>
                <col style="width: 15%"/>
                <col style="width: 7%"/>
                <col style="width: 15%"/>
                <col style="width: 8%"/>
            </colgroup>
            <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>조회수</th>
                <th>작성일</th>
                <th>첨부</th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="empty boardList">
                    <tr>
                        <td colspan="6">등록된 게시물이 없습니다.</td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${boardList}" var="item" varStatus="loop">
                        <tr>
                            <td>${item.postIdx}</td>
                            <td class="text-start">
                                <a href="/mvcBoard/View.do?idx=${item.postIdx}" class="text-decoration-none text-black">${item.postTitle}</a>
                            </td>
                            <td>${item.postWriter}</td>
                            <td>${item.postVisits}</td>
                            <td>${item.postDate}</td>
                            <td>
                                <c:if test="${not empty item.postOfile}">
                                    <a href="/mvcBoard/Download.do?ofile=${item.postOfile}&sfile=${item.postSfile}&idx=${item.postIdx}"
                                       class="text-decoration-none">Down</a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>
    </div>
    <div class="my-3">
<%-- 검색창 구현 시 사용할 부분--%>
    </div>
    <div class="my-3 d-flex justify-content-end">
        <a href="/mvcBoard/Write.do" class="btn btn-primary">글쓰기</a>
    </div>
</main>
<%@ include file="/layout/footer.jsp" %>

</body>
</html>
