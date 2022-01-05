<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp 내장 객체</title>
</head>
<body>

<!-- 요청메서드, 요청 URL, 프로토콜 종류, 서버 이름, 서버의 포트번호, 사용자 컴퓨터의 IP주소와 이름 -->
<h2>request 내장객체</h2>

<table border="1">
	<tr>
		<td>요청 메서드 : </td>
		<td><%= request.getMethod() %></td>
	</tr>
	<tr>
		<td>요청 URL : </td>
		<td><%= request.getRequestURL() %></td>
	</tr>
	<tr>
		<td>프로토콜 종류 : </td>
		<td><%= request.getProtocol() %></td>
	</tr>
	<tr>
		<td>서버 이름 :</td>
		<td><%= request.getServerName() %></td>
	</tr>
	<tr>
		<td>서버 포트 번호 : </td>
		<td><%= request.getServerPort() %></td>
	</tr>
	<tr>
		<td>사용자 컴퓨터 IP 주소 : </td>
		<td><%= request.getRemoteAddr() %></td>
	</tr>
	<tr>
		<td>사용자 컴퓨터 이름 : </td>
		<td><%= request.getRemoteHost() %></td>
	</tr>
</table>

</body>

</html>