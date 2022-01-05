<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 현재 페이지에서 세션종료
	// session.invalidate();

	// 특정한 이름의 세션을 종료
	session.removeAttribute("id");
	
	String pw = (String) session.getAttribute("pw");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>로그아웃 되었습니다.</h3>
<h5>세션 종료</h5>
<h5>pw : <%= pw %></h5>
<a href="Session02.jsp">02로 이동</a>

</body>
</html>