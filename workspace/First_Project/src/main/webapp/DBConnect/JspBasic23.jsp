<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학과 삭제</title>
<script>
	function check() {
		if(document.delform.dept_id.value == "") {
			alert("학과코드는 필수입니다.");
			return;
		}
		document.delform.submit();
	}
</script>
</head>
<body>

<h4>학과 삭제</h4>
<form method="post" action="JspBasic24.jsp" name="delform">
	<table border="1">
		<tr>
			<td>학과 코드</td>
			<td><input type="text" name="dept_id"></td>
		</tr>
		<tr align="center">
			<td colspan="2">
				<input type="button" value="삭제"	 onclick="check()">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
</form>

</body>
</html>