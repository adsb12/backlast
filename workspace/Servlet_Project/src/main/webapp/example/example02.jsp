<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Controller 예제1</title>
</head>
<body>
<h3>Controller</h3><!-- ↓ 파라미터를 받아온다. -->
<%= request.getParameter("year") %> -> <%= request.getAttribute("rs") %>
</body>
</html>