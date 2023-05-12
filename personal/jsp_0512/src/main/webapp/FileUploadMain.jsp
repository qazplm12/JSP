<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-12
  Time: 오전 9:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>FileUpload</title>
</head>
<script>
    function validateForm(form) {
        if (form.name.value == "") {
            alert("작성자를 입력하세요.");
            form.name.focus();
            return false;
        }
        if (form.title.value == "") {
            alert("제목을 입력하세요.");
            form.name.focus();
            return false;
        }
        if (form.attachedFile.value == "") {
            alert("첨부파일은 필수 입력입니다.");
            return false;
        }
    }
</script>
<body>
<div class="container my-4">
    <h3>파일 업로드</h3>
    <span class="text-danger">${errorMessage}</span>
    <div class="col-6">
        <form action="UploadProcess.jsp" method="post" enctype="multipart/form-data" name="fileForm"
              class="form-control"
              onsubmit="return validateForm(this);">
            작성자 : <input type="text" name="name" value="머스트해브" class="form-control"> <br>
            제목 : <input type="text" name="title" class="form-control"> <br>
            카테고리(선택사항) :
            <%-- checkbox 사용 시 name 속성의 값이 동일하면 서버에 배열로 전달 --%>
            <input type="checkbox" name="cate" value="사진" checked class="form-checkbox">사진
            <input type="checkbox" name="cate" value="과제" class="form-checkbox">과제
            <input type="checkbox" name="cate" value="워드" class="form-checkbox">워드
            <input type="checkbox" name="cate" value="음원" class="form-checkbox">음원 <br>
            첨부파일 : <input type="file" name="attachedFile" class="form-control"> <br>
            <input type="submit" value="전송하기" class="btn btn-primary">
        </form>
        <a href="FileList.jsp" class="btn btn-link">DB에 등록된 파일 목록 보기</a>
    </div>
</div>
</body>
</html>
