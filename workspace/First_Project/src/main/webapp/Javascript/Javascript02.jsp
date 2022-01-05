<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var a = 200;
	var b = 30;
	
	// alert(a / b);
	
	var flag = confirm('진행하시겠습니까?');
	
	// 조건문
	if(flag) {
		alert('진행중~');
	} else {
		alert('중지!!');
	}
	
	// for 반복문
	var arr = [1, 2, 3, 4, 5];
	for(var i = 0; i < arr.length; i++) {
		console.log(arr[i]);
	}
	
	// while 반복문
	var n = 0;
	while(n < 3) {
		console.log(n);
		n++;
	}
	
</script>

<script>
	// script 언어는 데이터 타입이 없어서
	// 함수에 반환타입을 지정하지 않음
	function add(a, b) {
		alert(a + b);
		return a + b;
	}
	
	// 반환값이 없을 때
	// 함수를 강제종료 시키고자하면 return; 을 사용
	function confirmed(n) {
		if(n < 5) {
			alert('n은 5보다 작습니다.');
			return;
		}
		var rs = 1;
		for(var i = 1; i <= n; i++) {
			rs *= i;
		}
		alert(n + '의 펙토리얼은 ' + rs + '입니다.');
	}
	
	confirmed(3);
	
	// add(1, 3);
	
</script>

</head>
<body>

</body>
</html>