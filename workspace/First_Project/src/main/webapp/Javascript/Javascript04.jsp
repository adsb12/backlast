<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	function backPage() {
		var rs = confirm('정말 뒤로가시겠습니까?');
		if(rs) {
			// 뒤로가기 기능
			history.back();
		}
	}
</script>
</head>
<body>

	<button type="button" onclick="backPage()">뒤로가기</button>

</body>
</html>