<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%
	// 로그인 되었을 때 해당 유저의 id가 저장될 변수
	String userId = null;

	// 세션에 "userId" 이름을 가지는 value가 존재하면 
	// userId 변수에 해당 value를 저장
	// 로그인 상태 확인
	if(session.getAttribute("userId") != null) {
		userId = (String) session.getAttribute("userId");
	}
	
	// 로그인 되있지 않을 때 로그인 페이지로 돌려보냄
	if(userId == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.');");
		script.println("location.href = 'login.jsp';");
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
	<div class="collapse navbar-collapse" id="#bs-navbar-collapse">
	
		<!--  메인 메뉴 -->
		<!-- ul : 순서가 없는 리스트를 만들어주는 태그 -->
		<ul class="nav navbar-nav">
		<!-- li : 리스트 하나의 요소를 만들어주는 HTML 태그 -->
			<li><a href="main.jsp">메인</a></li>
			<li class="active"><a href="bbs.jsp">게시판</a></li>
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

<!-- 글쓰기 양식 -->
<div class="container">
	<div class="row">
		<form method="post" action="writeAction.jsp">
			<table class="table table-striped" style="text-align: center; border: 1px solid #bbbbbb;">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50"></td>
					</tr>
					<tr>
							<!-- textarea : 장문의 문자를 입력받는 HTML 입력 태그 -->
						<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" style="height: 350px;"></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
		</form>
	</div>
</div>
<!-- 글쓰기 양식 종료 -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>