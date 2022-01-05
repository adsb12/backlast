<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--쿠키 사용을 위한 import --%>
<%@ page import="javax.servlet.http.Cookie" %>
<%
	// myCookie 라는 이름을 가지고 1이라는 값을 가지는 cookie 생성
	Cookie cookie = new Cookie("myCookie", "1");
	// 유효기간 설정 (30일)
	cookie.setMaxAge(60 * 60 * 24 * 30);
	// 클라이언트에 쿠키 전송
	response.addCookie(cookie);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h4>쿠키 생성</h4>

</body>
</html>