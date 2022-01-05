<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사칙연산 계산기</title>
</head>
<body>
	<form method = "POST" action = "./Calc">
		<input type = "text" name = "num1">
		<select name = "op">
			<option selected>+</option>
			<option>-</option>
			<option>*</option>
			<option>/</option>
		</select>
		
		<input type = "text" name = "num2">
		<input type = "submit" value = "계산">
	</form>
</body>
</html>