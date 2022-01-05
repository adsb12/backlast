<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과목 추가 페이지</title>
</head>
<body>
<form method="get" action="CourseRegistAction2.jsp">
	<table border="1">
		<tr>
			<td>과목코드</td>
			<td><input type="text" name="course_id" maxlength="5"></td>
		</tr>
		<tr>
			<td>과목명</td>
			<td><input type="text" name="title"></td>
		</tr>
		<tr>
			<td>학점수</td>
			<td><input type="text" name="c_number"></td>
		</tr>
		<tr>
			<td>교수번호</td>
			<td><input type="text" name="professor_id" maxlength="3"></td>
		</tr>
		<tr>
			<td>추가금액</td>
			<td><input type="text" name="course_fees"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="입력">
			</td>
		</tr>
	</table>
</form>
</body>
</html>