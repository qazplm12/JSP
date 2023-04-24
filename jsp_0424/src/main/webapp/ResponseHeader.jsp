<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-24
  Time: 오전 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%-- 클라이언트에서 전송한 데이터 가져오기--%>
<%
    // 사용자 날짜 지정 방식 사용
    SimpleDateFormat s = new SimpleDateFormat("yyyy-mm-ss");
    // 클라이언트가 서버로 전달한 데이터 중 add_date 이름으로 전달된 데이터 가져오기
    long add_date = s.parse(request.getParameter("add_date")).getTime();
    // 클라이언트가 서버로 전달한 데이터는 기본적으로 문자열 형태임
    // 정수로 변경하기 위해서 parseInt() 메소드 사용
    int add_int = Integer.parseInt(request.getParameter("add_int"));
    String add_str = request.getParameter("add_str");

    // 클라이언트에서 가져온 데이터를 내장 객체인 response에 추가
    response.addDateHeader("myBirthday", add_date);
    response.addIntHeader("myNumber", add_int);
    response.addIntHeader("myNumber", 1004); // 새로운 데이터 추가
    response.addHeader("myName", add_str);
    response.addHeader("myName", "안중근"); // 기존에 존재하는 데이터를 사용자가 원하는 데이터로 변경
%>

<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>내장 객체 - response </title>
</head>
<body>
<div class="container">
    <h2>응답 헤더 정보 출력하기</h2>
    <%
        // 내장 객체 response가 가지고 있는 header 정보의 이름을 모두 가져옴
        Collection<String> headerNames = response.getHeaderNames();
        // 향상된 for문을 사용하여 해당 객체가 가지고 있는 모든 요소를 출력
        for (String hName : headerNames) {
            // getHeader(헤더명) : 지정한 헤더명과 1:1로 연결된 데이터를 출력
            String hValue = response.getHeader(hName);
    %>
    <li><%= hName%> : <%= hValue%></li>
    <%
        }
    %>

    <h2>myNumber만 출력하기</h2>
<%--    <%--%>
<%--        Collection<String> myNumber = response.getHeaders("myNumber");--%>
<%--        for (String myNum : myNumber) {--%>
<%--    %>--%>
<%--    <li>myNumber : <%= myNum %></li>--%>
<%--    <%--%>
<%--        }--%>
<%--    %>--%>
    <%
        Collection<String> myNumber = response.getHeaders("myNumber");
        for (String myNum : myNumber) {
            out.print("<li>myNumber : " + myNum + "</li>");
        }
    %>
</div>
</body>
</html>
