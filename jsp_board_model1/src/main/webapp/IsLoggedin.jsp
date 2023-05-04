<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-03
  Time: 오전 11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
  if (session.getAttribute("userId") == null) {
    // 지정한 페이지를 제외한 페이지에서 로그인 체크를 진행
    if (!(request.getRequestURI().equals("/Login.jsp") || request.getRequestURI().equals("/BoardList.jsp") || request.getRequestURI().equals("/BoardRead.jsp"))) {
      String errMsg = "<Script>";
      errMsg += "<alert('로그인 후 이용해 주세요');";
      errMsg += "location.href='Login.jsp';";
      errMsg += "</script>";

      out.println(errMsg);
    }
  }
%>