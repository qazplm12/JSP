<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-10
  Time: 오후 12:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="com.bitc.jsp_0510.Person" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>JSTL - forEach 예제</title>
</head>
<body>
<div class="container my-4">
    <h4>List 컬렉션 사용하기</h4>
    <%
        LinkedList<Person> lists = new LinkedList<Person>();
        lists.add(new Person("맹사성", 34));
        lists.add(new Person("장영실", 44));
        lists.add(new Person("신숙주", 54));
    %>
<%-- jstl을 사용ㅎ여 리스트 객체를 page 영역에 저장 --%>
    <c:set var="lists" value="<%= lists%>"/>
    <ul>
        <c:forEach items="${lists}" var="list">
            <li>
                이름 : ${list.name}, 나이 : ${list.age}
            </li>
        </c:forEach>
    </ul>

    <h4>Map 컬렉션 사용하기</h4>
    <%
        Map<String, Person> maps = new HashMap<String, Person>();
        maps.put("1st", new Person("맹사성", 34));
        maps.put("2nd", new Person("장영실", 44));
        maps.put("3rd", new Person("신숙주", 54));
    %>
    <c:set var="maps" value="<%=maps%>"/>
    <c:forEach items="${maps}" var="map">
        <li>key => ${map.key} <br>
            Value => 이름 ${map.value.name}, 나이 : ${map.value.age}</li>
    </c:forEach>
</div>
</body>
</html>
