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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>로그인 입력 화면</h2>

<form method="post" action="Cookie03.jsp">
	<table border="1">
		<tr>
			<td>아이디</td>
			<% if(cookie == null) { %>
			<td><input type="text" name="id"></td>
			<% } else { %>
			<td><input type="text" name="id" value="<%= cookie.getValue() %>"></td>
			<% } %>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pw"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="로그인">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
</form>

</body>
</html>