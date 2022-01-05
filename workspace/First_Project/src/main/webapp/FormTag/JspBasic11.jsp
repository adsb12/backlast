<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>로그인 입력 화면에서 받은 아이디와 비밀번호</h2>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>

<p>입력 아이디 : <%= id %></p>
<p>입력 비밀번호 : <%= pw %></p>

</body>
</html>