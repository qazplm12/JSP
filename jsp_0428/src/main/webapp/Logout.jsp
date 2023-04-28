<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-28
  Time: 오전 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
  // 등록된 세션 정보를 삭제
  session.removeAttribute("UserId");
  session.removeAttribute("UserName");

  // 등록된 모든 세션 정보를 삭제
  session.invalidate();

  response.sendRedirect("./LoginForm.jsp");
%>