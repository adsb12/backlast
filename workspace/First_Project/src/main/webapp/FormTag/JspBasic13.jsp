<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>성별과 좋아하는 과목</h2>
<%
	String gender = request.getParameter("gender");
	String[] fruits =  request.getParameterValues("fruits");
%>

<p>성별 : <%= gender %></p>
<p>좋아하는 과일 : </p>
<% for(int i = 0; i < fruits.length; i++) { %>
  - <%= fruits[i] %><br>
<% } %>

</body>
</html>