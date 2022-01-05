<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>당신이 선택한 영상은</h2>
<%
	String[] videos = request.getParameterValues("video");

	for(int i = 0; i < videos.length; i++) {
%>	
	- <%= videos[i] %> <br>
<% 	} %>

</body>
</html>