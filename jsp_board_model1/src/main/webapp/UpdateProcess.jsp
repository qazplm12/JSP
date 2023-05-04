<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-02
  Time: 오후 3:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.bitc.jsp_board_model1.BoardDto" %>
<%@ page import="com.bitc.jsp_board_model1.BoardDao" %>
<%
  // 이전 페이지에서 수정할 데이터 정보 가져오기
  int postNum = Integer.parseInt(request.getParameter("postNum"));
  String postTitle = request.getParameter("postTitle");
  String postWriteUser = request.getParameter("postWriteUser");
  String postContent = request.getParameter("postContent");

  // 데이터 베이스 연결
  BoardDao dao = new BoardDao();
  dao.dbOpen();
  // 가져온 데이터로 데이터 수정하기
  int updateResult = dao.updateBoard(postNum, postTitle, postContent);
  dao.dbClose();
  // 수정 완료시 BoardList.jsp 혹은 이전 페이지로 이동
  if (updateResult == 1) {
    response.sendRedirect("BoardList.jsp");
//    response.sendRedirect("BoardRead.jsp?postNum=" + postNum);
  } else {
    String errMsg = "<script>";
    errMsg += "alert('게시물 수정 중 오류가 발생했습니다.');";
    errMsg += "history.back();";
    errMsg += "</script>";

    out.println(errMsg);
  }
%>