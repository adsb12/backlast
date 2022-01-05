<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학과 수정</title>
<script>
	function check() {
		if(document.idform.dept_id.value == "") {
			alert("학과코드는 필수입니다.");
			return;
		}
		document.idform.submit();
	}
</script>
<style>
	h4{
	color:aqua;
	}
</style>
</head>
<body>

	<h4>학과 정보 수정</h4>
	<form method="post" action="JspBasic21.jsp" name="idform">
		<table border="1">
			<tr>
				<td align="center">학과코드</td>
				<td><input type="text" name="dept_id"></td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<input type="button" value="수정" onclick="check()">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>