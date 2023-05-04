<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>


<br><hr><br>

<div class="container my-4">
    <ul>
        <li><a href="ImplicitObjMain.jsp" class="btn-link">ImplicitObjMain 예제</a></li>
        <li><a href="ImplicitForwardResult.jsp" class="btn-link">ImplicitForwardResult 예제</a></li>
    </ul>
</div>

</body>
</html>