<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	function check() {
		if(document.deptinput.dept_id.value == "") {
			alert("학과코드는 필수입니다!");
			return;
		}
		document.deptinput.submit();
	}
</script>
</head>
<body>

<h4>DEPARTMENT 입력</h4>
<form method="post" action="JspBasic27.jsp" name="deptinput">
	<table border="1">
		<tr>
			<td>학과코드</td>
			<td><input type="text" name="dept_id"></td>
		</tr>
		<tr>
			<td>학과명</td>
			<td><input type="text" name="dept_name"></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" name="dept_tel"></td>
		</tr>
		<tr align="center">
			<td colspan="2">
				<input type="button" value="추가" onclick="check()">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
</form>

</body>
</html>