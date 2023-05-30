<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yeahc
  Date: 2023-05-31
  Time: 오전 12:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
</head>
<body>
<c:import url="layout/header.jsp"/>
<main class="container my-5">
    <div class="my-4 text-center">
        <h2>회원관리</h2>
    </div>
    <table class="table text-center mt-5">
        <colgroup>
            <col style="width: 20%"/>
            <col style="width: 20%"/>
            <col style="width: 40%"/>
            <col style="width: 20%"/>
        </colgroup>
        <thead class="text-center fs-4">
        <th>아이디</th>
        <th>이름</th>
        <th>이메일</th>
        <th>등급</th>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="empty memberList">
                <tr>
                    <td colspan="4">등록된 회원이 없습니다.</td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach items="${memberList}" var="item" varStatus="loop">
                    <tr class="fs-5">
                        <td class="py-4">${item.id}</td>
                        <td class="py-4">${item.name}</td>
                        <td class="py-4">${item.email}</td>
                        <td class="py-4">
                            <c:choose>
                                <c:when test="${sessionScope.get('grade') == 2 && item.grade != 2}">
                                    <select id="select" class="form-select form-select-sm" onchange="changeSelect()">
                                        <c:choose>
                                            <c:when test="${item.grade == 0}">
                                                <option value="0">일반회원</option>
                                                <option value="1">관리자</option>
                                            </c:when>
                                            <c:when test="${item.grade == 1}">
                                                <option value="1">관리자</option>
                                                <option value="0">일반회원</option>
                                            </c:when>
                                        </c:choose>
                                    </select>

                                </c:when>
                                <c:otherwise>
                                    <c:choose>
                                        <c:when test="${item.grade == 2}">최고 관리자</c:when>
                                        <c:when test="${item.grade == 1}">관리자</c:when>
                                        <c:otherwise>일반회원</c:otherwise>
                                    </c:choose>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>
</main>
<script>
    function changeSelect() {
        let select = document.getElementById("select");
        let selectValue = select.options[select.selectedIndex].value;

        if (confirm('정말 변경하시겠습니까?')) {
            
            location.href = "/changeGrade.do?=" + selectValue;
        }
    }
</script>
</body>
</html>
