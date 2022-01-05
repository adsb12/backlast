<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 입력 화면</title>
</head>
<body>

<h2>로그인 입력 화면</h2>

<form method="post" action="JspBasic26.jsp">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="uid"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="upw"></td>
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