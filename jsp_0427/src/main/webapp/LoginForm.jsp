<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-27
  Time: 오후 3:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%-- 세션 : 웹의 저장 공간 중 하나로 서버에 데이터를 저장--%>
<%-- 클라이언트의 접속이 종료되거나 웹 브라우저를 완전히 닫을 경우, 지정된 시간을 초과하면 세션이 종료되며 서버에서 저장된 내용이 삭제 됨 --%>

<%-- 세션 내장 객체 주요 메소드 --%>
<%-- getAttribute(이름) : 지정된 이름의 세션 데이터를 출력 --%>
<%-- getAttributeNames() : 해당 세션에 등록된 모든 세션 데이터의 이름을 출력--%>
<%-- getCreationTime() : 해당 세션이 등록된 시간을 출력--%>
<%-- getId() : 해당 세션 ID를 출력--%>
<%-- getLastAccessedTime() : 세션으로 서버에 마지막으로 요청한 시간을 출력 --%>
<%-- getMaxInactiveInterval() : 세션 최대 유지 시간을 출력--%>
<%-- inNew() : 해당 세션이 새로 생성된 세션인지 아닌지 출력 --%>
<%-- removeAttribute(이름) : 지정한 이름의 세션 데이터를 삭제--%>
<%-- setAttribute(이름, 데이터) : 지정된 데이터를 지정한 세션 이름으로 등록--%>
<%-- setMaxInactiveInterval(시간) : 세션 최대 유지 시간을 설정 --%>
<%-- invalidate() : 해당 세션의 모든 데이터를 삭제--%>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>세션 사용하기</title>
</head>
<body>
<div class="container my-4">
  <div class="row">
    <div class="col-sm-4 mx-auto">
      <form method="post" action="LoginProcess.jsp">
      <div class="my-3">
        <label for="user-id" class="form-label">ID :</label>
        <input type="text" class="form-control" id="user-id" name="userId" placeholder="아이디를 입력하세요">
      </div>
        <div class="my-3">
          <label for="user-pw" class="form-label">PW :</label>
          <input type="text" class="form-control" id="user-pw" name="userPw" placeholder="비밀번호를 입력하세요">
        </div>
        <div class="my-3 d-grid gap-3">
          <button type="submit" class="btn btn-primary">로그인</button>
          <a class="btn btn-info" href="./LoginInfo.jsp">LoginInfo로 이동</a>

        </div>

      </form>
    </div>
  </div>
</div>

</body>
</html>
