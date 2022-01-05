<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="user" class="user.UserBean" scope="page" />
<jsp:setProperty name="user" property="id" param="uid" />
<jsp:setProperty name="user" property="pw" value="1234" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>로그인정보</h4>
<p> 아이디 : <jsp:getProperty property="id" name="user"/> </p>
<p> 비밀번호 : <jsp:getProperty property="pw" name="user"/> </p>
</body>
</html>