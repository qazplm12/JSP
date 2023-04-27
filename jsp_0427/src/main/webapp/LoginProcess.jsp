<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-27
  Time: 오후 3:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Title</title>
</head>
<body>
<div class="container">
  <%
    String script = "<script>";
    request.setCharacterEncoding("UTF-8");

    // 클라이언트에서 전송한 사용자 정보
    String userId = request.getParameter("userId");
    String userPw = request.getParameter("userPw");

    // 클라이언트에서 전송한 사용자 정보와 로그인 정보가 같으면 세션 추가
    if (userId.equals("test1") && userPw.equals("1234")) {

      // 세션에 데이터 추가, 모든 데이터를 Object 타입으로 저장
      session.setAttribute("userId", userId);
      session.setAttribute("userPw", userPw);
      // 서버에 해당 세션을 유지할 시간 설정
      session.setMaxInactiveInterval(20);

      script += "alert('세션 설정이 성공 했습니다.');";
      script += "location.href='./LoginInfo.jsp';";
      script += "</script>";

      out.println(script);
    } else {
      script += "alert('세션 설정이 실패했습니다.');";
      script += "history.back();";
      script += "</script>";

      out.println(script);
    }

  %>
  <a href="LoginInfo.jsp"></a>
</div>
</body>
</html>
