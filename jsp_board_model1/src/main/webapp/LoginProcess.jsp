<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-03
  Time: 오전 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 데이터 베이스 사용을 위한 DTO, DAO 클래스 import --%>
<%@ page import="com.bitc.jsp_board_model1.MemberDao" %>
<%@ page import="com.bitc.jsp_board_model1.MemberDto" %>

<%
    // 클라이언트에서 전달한 데이터 가져오기
    String userId = request.getParameter("userId");
    String userPw = request.getParameter("userPw");

// 데이터 베이스 연결 및 사용자 정보 확인
    MemberDao dao = new MemberDao();
    dao.dbOpen();

// 클라이언트에서 전달한 정보가 데이터 베이스에 존재하는지 확인
    int selectResult = dao.isMember(userId, userPw);

    if (selectResult == 1) {
        // 사용자 정보를 데이터 베이스에서 가져옴
        MemberDto member = dao.selectMember(userId, userPw);
        // 세션에 데이터 저장
        session.setAttribute("userId", member.getUserId());
        session.setAttribute("userName", member.getUserName());
        session.setMaxInactiveInterval(60*5);

        // 첫 화면으로 이동
        response.sendRedirect("BoardList.jsp");

    } else {
        String errMsg = "<script>";
        errMsg += "alert('ID나 비밀번호가 다릅니다.'); ";
        errMsg += "history.back(); ";
        errMsg += "</script>";

        out.println(errMsg);
    }
%>

