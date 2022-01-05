<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h5>radio box</h5>
<input type="radio" name="rd1" value="1" checked> 1
<input type="radio" name="rd1" value="2"> 2
<input type="radio" name="rd2" value="3"> 3
<input type="radio" name="rd2" value="4"> 4

<h5>check box</h5>
<input type="checkbox" name="cb1" value="a" checked> a
<input type="checkbox" name="cb1" value="b"> b
<input type="checkbox" name="cb1" value="c"> c
<input type="checkbox" name="cb1" value="d"> d

<form method="get" action="JspBasic13.jsp">

	<h2>성별과 좋아하는 과일을 선택하세요.</h2>
	<h4>성별을 선택하세요. (radio)</h4>
	<input type="radio" name="gender" value="여" checked> 여
	<input type="radio" name="gender" value="남"> 남
	
	<h4>좋아하는 과일을 선택하세요. (checkbox)</h4>
	<input type="checkbox" name="fruits" value="apple"> 사과
	<input type="checkbox" name="fruits" value="banana" checked> 바나나
	<input type="checkbox" name="fruits" value="mango"> 망고
	<input type="checkbox" name="fruits" value="dragonfruit" checked> 드레곤후르츠
	<input type="checkbox" name="fruits" value="orange"> 오렌지
	
	<br>
	
	<input type="submit" value="전송">
		
</form>

</body>
</html>