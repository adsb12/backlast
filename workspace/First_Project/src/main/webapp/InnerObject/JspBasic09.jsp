<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 내장 객체</title>
</head>
<body>

<h2>application 내장 객체</h2>
<%
	String serverInfo = application.getServerInfo();
	String realPath	  = application.getRealPath("/");
%>
<p> Server Info : <%= serverInfo %> </p>
<p> Real Path : <%= realPath %> </p>
</body>
</html>