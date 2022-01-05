<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.Cookie" %>
<%
	Cookie cookie = null;
	Cookie[] cookies = request.getCookies();
	
	for(int i = 0; i < cookies.length; i++) {
		if(cookies[i].getName().equals("userId")) {
			cookie = cookies[i];
			break;
		}
	}
	
	// 쿠키 삭제를 위해 유효기간을 0으로 설정
	cookie.setMaxAge(0);
	
	response.addCookie(cookie);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h4>userId 쿠키를 삭제했습니다.</h4>

</body>
</html>