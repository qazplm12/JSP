<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-02
  Time: 오전 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 데이터 베이스 사용을 위해 DTO, DAO 클래스를 가져옴--%>
<%@ page import="com.bitc.jsp_board_model1.BoardDao"%>
<%@ page import="com.bitc.jsp_board_model1.BoardDto"%>
<%@ include file="IsLoggedin.jsp"%>
<%-- 글쓰기 페이지에서 사용자가 입력한 내용을 가져오기--%>
<%
//    request.setCharacterEncoding("UTF-8");
    String postTitle = request.getParameter("postTitle");
    String postContent = request.getParameter("postContent");

    // 데이터 베이스에 전송하기 위한 DTO 클래스 타입의 객체에 저장
    BoardDto dto = new BoardDto();
    dto.setPostTitle(postTitle);
    dto.setPostContent(postContent);
    // 세션 정보에 저장된 userId를 불러와서 사용해야 함
    dto.setPostWriteUser(session.getAttribute("userId").toString());

    // 데이터 베이스 이용을 위해서 DAO 클래스 타입의 객체 생성
    BoardDao dao = new BoardDao();
    dao.dbOpen();
    // DAO 객체에서 제공하는 insert 메소드를 사용하여 데이터 베이스에 글 등록
    int insertResult = dao.insertBoard(dto);
    dao.dbClose();
    // 글 등록 성공 및 실패에 따라 화면 이동
    if (insertResult == 1) {
        response.sendRedirect("BoardList.jsp");
    } else {
        String script = "<script>";
        script += "alert('글쓰기 중 오류가 발생했습니다.');";
        script += "history.back();";
        script += "</script>";

        out.println(script);
    }

%>