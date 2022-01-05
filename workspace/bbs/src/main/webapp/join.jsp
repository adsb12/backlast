<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%
	//로그인 되었을 때 해당 유저의 id가 저장될 변수
	String userId = null;

	// 세션에 "userId" 이름을 가지는 value가 존재하면 
	// userId 변수에 해당 value를 저장
	// 로그인 상태 확인
	if(session.getAttribute("userId") != null) {
		// PrintWriter : 페이지에 스크립트문 작성할 때 사용
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인 되있습니다.');");
		script.println("location.href = 'main.jsp';");
		script.println("</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판</title>
<meta http-equiv="Conetent-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
</head>
<body>

<!-- 메인 네비게이션 -->
<!-- nav : 네비게이션 리스트 만들어주는 HTML 태그 -->
<nav class="navbar navbar-default">
	<!-- 네비게이션 헤더 -->
	<!-- div : 웹 페이지에서 공간을 지정하는 HTML 태그 (가로 전체) -->
	<div class="navbar-header">
	<!-- button : 버튼을 만들어주는 HTML 태그 -->
		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-navbar-collapse" aria-expanded="false">
			<!-- span : 웸 페이지에서 공간을 지정하는 HTML 태그 (컨텐츠 사이즈 가로) -->
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<!--  a : url을 이동시켜주는 태그 href="" 속성에 경로 지정 -->
		<a class="navbar-brand" href="main.jsp">JSP 게시판</a>
	</div>
	<!--  네비게이션 헤더 종료 -->
	
	<!--  네비게이션 메뉴 -->
	<div class="collapse navbar-collapse" id="bs-navbar-collapse">
	
		<!--  메인 메뉴 -->
		<!-- ul : 순서가 없는 리스트를 만들어주는 태그 -->
		<ul class="nav navbar-nav">
		<!-- li : 리스트 하나의 요소를 만들어주는 HTML 태그 -->
			<li class="active"><a href="main.jsp">메인</a></li>
			<li><a href="bbs.jsp">게시판</a></li>
		</ul>
		<!-- 메인 메뉴 종료 -->
		
		<!-- 마이페이지 메뉴 -->
		<!--  로그인이 되어있지 않을 때 표시 -->
		<%
			if(userId == null) {
		%>
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
					마이페이지 <span class="caret"></span>
				</a>
				<ul class="dropdown-menu">
					<li><a href="login.jsp">로그인</a></li>
					<li><a href="join.jsp">회원가입</a></li>
				</ul>
			</li>
		</ul>
		<%
			} else {
		%>
		<!--  로그인이 되었을 때 표시 -->
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
					마이페이지 <span class="caret"></span>
				</a>
				<ul class="dropdown-menu">
					<li><a href="logoutAction.jsp">로그아웃</a></li>
				</ul>
			</li>
		</ul>
		<%
			}
		%>
		<!-- 마이페이지 메뉴 종료 -->
	</div>
	<!--  네비게이션 메뉴 종료 -->
</nav>
<!-- 메인 네비게이션 죵료 -->

<!-- 메인 컨첸츠 -->
<div class="container">
	<div class="col-lg-4"></div>
	<div class="col-lg-4">
		<div class="jumbotron">
			<form method="post" action="joinAction.jsp">
				<h3 style="text-align: center;">회원가입</h3>
				<!-- 아이디 입력 -->
				<div class="form-group">
					<input type="text" class="form-control" name="userId" placeholder="아이디">
				</div>
				<!-- 비밀번호 입력 -->
				<div class="form-group">
					<input type="password" class="form-control" name="userPw" placeholder="비밀번호">
				</div>
				<!-- 이름 입력 -->
				<div class="form-group">
					<input type="text" class="form-control" name="userName" placeholder="이름">
				</div>
				<!-- 성별 선택 -->
				<div class="form-group" style="text-align: center;">
					<div class="btn-group" data-toggel="buttons">
						<!-- label : UI 요소에 라벨을 정의하는 HTML 태그 -->
						<label class="btn btn-primary active">
							<!-- autocomplete 속성 : 과거 기록을 dropdown 형식으로 보여줄지를 선택 true : 보여줌, false : 보여주지않음 -->
							<input type="radio" name="userGender" autocomplete="off" value="m" checked>남자
						</label>
						<label class="btn btn-primary">
							<input type="radio" name="userGender" autocomplete="off" value="w">여자
						</label>
					</div>
				</div>
				<!-- 이메일 입력 -->
				<div class="form-group">
					<input type="email" class="form-control" name="userEmail" placeholder="이메일">
				</div>
				<!-- 제출 버튼 -->
				<div class="form-group">
					<input type="submit" class="btn btn-primary form-control" value="회원가입">
				</div>
			</form>
		</div>
	</div>
	<div class="col-lg-4"></div>
</div>
<!-- 메인 컨텐츠 종료 -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>