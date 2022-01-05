<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	function clicked() {
		// id 값을 이용해서 찾아옴
		// var input1 = document.getElementById('input1').value;
		// var input2 = document.getElementById('input2').value;
		
		// alert(input1 + ' ' + input2);

		// class 값을 이용해서 찾아옴
		// var input1 = document.getElementsByClassName('input1');
		
		// alert(input1[0].value);
		
		// name 값을 이용해서 찾아옴
		var input1 = document.getElementsByName('input1');
		
		alert(input1[0].value);
	}
</script>

<script>
	function movePage() {
		var input1 = document.getElementById('input1').value;
		if(input1 == null) {
			alrt('첫번째 인풋을 입력하세요.');
			return;
		}
		// 현재 페이지 url 변경
		// location.href = input1;
		
		// 현재 페이지를 해당 url로 새로 만듦
		// location.replace(input1);
		
		// 페이지 새로고침
		// location.reload();
		
		// location.href = 'Javascript04.jsp';
		
		// 윈도우창에 새로운 윈도우를 생성 (팝업)
		window.open('Javascript04.jsp', 'new', 'width=800, height=400');
	}
</script>

</head>
<body>

<!-- class : 중복돼서 사용될수 있음 -->
<!-- id : 중복 불가능 -->
<!-- name : form 내부에서는 중복이 불가능, 외부 form 중복이 허용됨 -->
<input class="" id="" type="text" name="" value="">
<input class="" id="" type="text" name="" value="">

<form method="post">
	<input type="text" class="input1" id="input1" name="input1" value="">
	<input type="text" class="input1" id="input2" name="input2" value="">
	<button type="button" onclick="clicked();">클릭</button>
	<button type="button" onclick="movePage()">전달</button>
</form>

</body>
</html>