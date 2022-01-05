<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>로그인 입력 화면</h2>

<form method="post" action="Session02.jsp">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pw"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="로그인">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
	
</form>
</body>
</html>