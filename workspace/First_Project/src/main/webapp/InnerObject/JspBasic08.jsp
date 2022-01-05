<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session 내장 객체</title>
</head>
<body>

<h2>session 내장 객체</h2>
<p> 아이디 입력 </p>

<form method="post">
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id"></td>
		</tr>
	</table>
</form>
<%
	String user ="";
	if(request.getParameter("id") != null) {
		user = request.getParameter("id");
		session.setAttribute("user",user);
		response.sendRedirect("JspBasic08-01.jsp");
	}
%>
</body>
</html>