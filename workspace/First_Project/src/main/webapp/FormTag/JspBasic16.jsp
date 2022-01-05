<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	function check() {
		if(document.login.id.value == "") {
			alert("아이디를 입력하세요.");
			return;
		}
		if(document.login.pw.value == "") {
			alert("비밀번호를 입력하세요.");	
			return;
		}
		document.login.submit();
	}
</script>

</head>
<body>

<h2>로그인 입력 화면</h2>

<form method="post" action="JspBasic11.jsp" name="login">
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
				<input type="button" value="로그인" onclick="check()">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
</form>

</body>
</html>