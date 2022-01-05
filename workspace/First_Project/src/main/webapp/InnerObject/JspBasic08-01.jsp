<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session 내장객체</title>
</head>
<body>

<h2>session 내장 객체</h2>
<p>세션 ID : <%= session.getAttribute("user") %></p>

</body>
</html>