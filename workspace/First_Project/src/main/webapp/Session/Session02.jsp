<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// 세션에 등록
	// .setAttribute(세션 이름, 값);
	session.setAttribute("id", id);
	session.setAttribute("pw", pw);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h4>세션 값 확인 페이지 : <a href="Session03.jsp">이동</a></h4>

</body>
</html>