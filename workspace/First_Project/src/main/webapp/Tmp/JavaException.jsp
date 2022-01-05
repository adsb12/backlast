<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
	int a = 10;
	int b = 0;
	int[] arr = {1, 2, 3, 4, 5};
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	try {
%>	
	<%= a/b %>
	<%= arr[5] %>
<%	
	} catch(Exception e) {    // 산술 예외
%>
	<p>예외 발생</p>
<%
	} finally {
%>
	<p>연산완료</p>
<%
	}
%>

</body>
</html>