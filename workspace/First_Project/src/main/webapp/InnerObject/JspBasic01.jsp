<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<%
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("a hh:mm yyyy-MM-dd");
%>
<html>
<head>
<meta charset="UTF-8">
<title>page 지시어</title>
</head>
<body>
<p> system date : <%= date %> </p>
<p> <%= sdf.format(date) %> </p>
</body>
</html>