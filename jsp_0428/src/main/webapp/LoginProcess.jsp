<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-28
  Time: 오전 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%-- 데이터 베이스를 사용 하기 DTO 와 DAO 클래스를 모두 import--%>
<%@ page import="com.bitc.jsp_0428.MemberDAO" %>
<%@ page import="com.bitc.jsp_0428.MemberDTO" %>

<%
    // 클라이언트에서 전달된 데이터 가져오기
    String userId = request.getParameter("user_id");
    String userPw = request.getParameter("user_pw");

    String dbDriver = application.getInitParameter("MySQLDriver");
    String dbUrl = application.getInitParameter("dbUrl");
    String opt1 = application.getInitParameter("dbUrlOpt1");
    String opt2 = application.getInitParameter("dbUrlOpt2");
    String opt3 = application.getInitParameter("dbUrlOpt3");
    dbUrl += "?" + opt1 + "&" + opt2 + "&" + opt3;
    String dbUserId = application.getInitParameter("dbUserId");
    String dbUserPw = application.getInitParameter("dbUserPw");

    // DB객체 생성
    MemberDAO dao = new MemberDAO(dbDriver, dbUrl, dbUserId, dbUserPw);
    // 데이터베이스와 데이터를 주고받을 DTO 클래스 타입의 객체 생성
    // DAO를 통해서 데이터 가져오기
    MemberDTO memberDTO = dao.getMemberDTO(userId, userPw);
    dao.close();

    // 가져온 DTO객체에 데이터가 있는지 확인
    if (memberDTO.getId() != null) {
        // 데이터가 있을 경우 세션에 데이터 추가
        session.setAttribute("UserId", memberDTO.getId());
        session.setAttribute("UserName", memberDTO.getName());
        response.sendRedirect("LoginForm.jsp");
    } else {
        // 데이터가 없을 경우 내장객체 request에 오류 메시지 추가
        request.setAttribute("LoginErrMsg", "로그인 오류입니다.");
        request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
    }

%>