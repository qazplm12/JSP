<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-25
  Time: 오전 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    // 팝업창 상태 설정
    String popupMode = "on";

    //클라이언트에서 전송된 쿠키 정보를 읽어옴
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie c : cookies) {
            String cookieName = c.getName();
            String cookieValue = c.getValue();

            // 쿠키 이름이 "PopupClose"일경우 팝업창 상태 값을 변경
            if (cookieName.equals("PopupClose")) {
                popupMode = cookieValue;
            }
        }
    }
%>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>쿠키를 이용한 팝업 관리</title>
    <style>
        div#popup {
            position: absolute;
            top: 100px;
            left: 50px;
            color: yellow;
            width: 270px;
            height: 100px;
            background-color: gray;
        }

        div#popup > div {
            position: relative;
            background-color: #ffffff;
            top: 0px;
            border: 1px solid gray;
            padding: 10px;
            color: black;
        }
    </style>


    <script>
        $(document).ready(function () {
            // 닫기 버튼 클릭시 팝업창 닫기
            $('#closeBtn').click(function () {
                $('#popup').hide();

                // 팝업 창의 내용 중 체크 박스 확인
                // 체크 박스의 checked 속성이 checked 일 경우 (input 태그의) value 속성 값을 가져옴
                let chkVal = $("input:checkbox[id=inactiveToday]:checked").val();
                                // input 태그 중(checkbox 타입 중 [id 값이 inactiveToday인 태그] 중 상태값이 checked인 것.의 밸류값

                // jquery의 ajax 통신 함수, 지정한 서버와 비동기 통신
                $.ajax({
                    url: './PopupCookie.jsp',  // << 와 통신
                    type: "get",
                    data: {inactiveToday: chkVal},
                    dataType: "text",
                    // 통신 성공시
                    success: function (resData) {
                        // 통신 성공 시 전송된 데이터가 빈 값이 아닐 경우
                        if (resData != "") {
                            //현재 페이지 리프레쉬
                            location.reload();
                        }
                    }
                });

            });

        });
    </script>
</head>
<body>
<div class="container">
<h2>팝업 메인 페이지</h2>
    <%
        for (int i = 1; i < 10; i++) {
            out.print("현재 팝업창은 " + popupMode + " 상태입니다.<br/>");
        }
        if (popupMode.equals("on")) {

    %>
    <div id="popup">
        <h2>공지사항 팝업입니다.</h2>
        <div>
            <form name="popFrm">
                <input type="checkbox" id="inactiveToday" value="1">
                하루동안 열지않음
                <input type="button" value="닫기" id="closeBtn">
            </form>
        </div>
    </div>
    <%
        }
    %>
</div>
</body>
</html>
