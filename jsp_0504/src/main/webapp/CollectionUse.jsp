<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-04
  Time: 오전 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="com.bitc.jsp_0504.Person" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>표현 언어 - 컬렉션 사용</title>
</head>
<body>
<div class="container my-4">
    <h2>List 컬렉션</h2>
    <%
        List<Object> aList = new ArrayList<Object>();
        aList.add("청해진");
        aList.add(new Person("장보고", 28));
        pageContext.setAttribute("Ocean", aList);
    %>
    <ul>
        <li>0번째 요소 : ${Ocean[0]}</li>
        <li>1번째 요소 : ${Ocean[1].name}, ${Ocean[1].age}</li>
        <%-- 존재하지 않는 index의 데이터를 출력시 오류가 발생하는 것이 아니라 무시--%>
        <li>2번째 요소 : ${Ocean[2]}</li>

    </ul>
    <h2>Map 컬렉션</h2>
    <%
        Map<String, String> map = new HashMap<String, String>();
        map.put("한글", "훈민정음");
        map.put("Eng", "English");
        pageContext.setAttribute("King", map);
    %>
    <ul>
        <li>영문 key : ${King["Eng"] }, ${King['Eng']}, ${King.Eng}</li>
<%-- 표현언어를 통해서 내장 객체에 저장된 속성을 출력 시 한글이나 특수기호가 있으면 반드시 [] 사용--%>
        <li>한글 key : ${King["한글"] }, ${King['한글']}, \${King.한글}</li>
    </ul>
</div>
</body>
</html>
