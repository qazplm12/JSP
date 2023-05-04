<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-02
  Time: 오후 2:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 세션 확인--%>
<%@include file="IsLoggedin.jsp"%>

<%@ page import="com.bitc.jsp_board_model1.BoardDao" %>

<%
  // 삭제할 글 번호를 가져옴
  int postNum = Integer.parseInt(request.getParameter("postNum"));
  // 데이터 베이스 연결
  BoardDao dao = new BoardDao();
  dao.dbOpen();

  // dao 사용하여 현재 글의 게시물 삭제, 데이터 베이스 연결 종료
  int deleteResult = dao.deleteBoard(postNum);
  dao.dbClose();

  // 삭제 성공 시 BoardList.jsp 이동, 실패 시 오류 메시지 출력 후 이전 페이지로 이동
  if (deleteResult == 1) {
    //BoardList.jsp 페이지로 이동
    response.sendRedirect("BoardList.jsp");
  }  else {
    String errMsg = "<script>";
    errMsg += "alert('게시물 삭제 시 오류가 발생했습니다.');";
    errMsg += "history.back();";
    errMsg += "</script>";

    out.println(errMsg);
  }

%>