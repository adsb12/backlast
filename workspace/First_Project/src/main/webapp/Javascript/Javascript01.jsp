<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>

	// 알림창 띄우기
	alert('안녕하세요');
	
	// 선택창 띄우기
	// 확인 : true 반환, 취소 : false
	// JavaScript는 변수를 선언할 때 데이터타입을 특별하게 지정하지 않음
	var reply = confirm('확인 또는 취소 선택');
	alert(reply);
	
	// 프롬프트 입력창 띄우기
	var name = prompt('이름을 입력하세요.');
	alert(name);
	
	// 프롬프트 입력창 띄우기 (기본값 설정)
	var age = prompt('나이를 입력하세요.', 19);
	alert(age);
	
	// HTML에 문자 작성
	document.write('<h1>document Write</h1>');
	
	// consol창에 출력
	console.log('consol log 입니다!!!');
	
</script>

</head>
<body>

</body>
</html>