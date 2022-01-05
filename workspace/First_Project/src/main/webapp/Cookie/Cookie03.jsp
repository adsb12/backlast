<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.Cookie" %>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	boolean flag = false;
	
	// request를 이용해서 클라이언트에 저장되어있는 쿠키들을
	// 배열형태로 받아옴
	Cookie[] cookies = request.getCookies();
	
	// cookies 배열을 하나씩 검사하면서
	// userId라는 이름을 가지는 쿠키가 존재하는지 검사
	// 만약 존재한다면 flag를 true로 바꾸고 반복문을 종료
	for(int i = 0; i < cookies.length; i++) {
		if(cookies[i].getName().equals("userId")) {
			flag = true;
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

<% 
	if(!flag) {
		Cookie cookie = new Cookie("userId", id);
		cookie.setMaxAge(3600);
		response.addCookie(cookie);
%>
<h4>쿠키를 최초로 설정합니다.</h4>
<% } else { %>
<h4>쿠키가 존재합니다.</h4>

<form method="post" action="Cookie04.jsp">
	<input type="submit" value="쿠키 삭제">
</form>
<% } %>
<hr>
<h5>로그인 정보</h5>
<p>아이디 : <%= id %></p>
<p>비밀번호 : <%= pw %></p>
<p>쿠키헤더 : <%= request.getHeader("Cookie") %></p>

</body>
</html>