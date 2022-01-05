<%@ page language="java" contentType="text/html; charset=UTF-8"
    	pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>   
<%
		// 로그인 되었을 때 해당 유저의 id가 저장될 세션 변수
		String user_id = null;
		
		// 세션에 user_id 이름을 가지는 value가 존재하면 
		// user_id 변수에 해당 value를 저장
		// 로그인 상태 확인
		if(session.getAttribute("user_id") != null) {
			user_id = (String) session.getAttribute("user_id"); // 반환값 Object 타입이라 형변환 필수
		}
		
		// 로그인 되있지 않을 때 로그인 페이지로 돌려보냄
		if(user_id == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("location.href= '../home/login'");
			script.println("</script>");
		}
		
%>
<!DOCTYPE html>
<html>
<head>

<title>JSP 게시판</title>
<meta http-equiv="Conetent-Type" content = "text/html; charset = UTF-8">
<meta name="viewport" content = "width=device-width" initial-scale = "1">
<link rel = "stylesheet" href = "<%= request.getContextPath() %>/css/bootstrap.css" >
<link rel = "stylesheet" href = "<%= request.getContextPath() %>/css/custom.css">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src= "<%= request.getContextPath() %>/js/bootstrap.js"></script>
<script>
	$(document).ready(function() {
		$('form').submit(function(event) {
			
			
			
			var title = $('#title').val();
			var contents = $('#contents').val();
			
			if(title == '') {
				alert('제목을 입력하세요.');
				event.preventDefault();
				return;
			}
			
			if(contents == '') {
				alert('내용을 입력하세요.');
				event.preventDefault();
				return;
			}
		});
	});
</script>

</head>
<body>

<%-- 메인 네비게이션 --%>
<!--  nav : 네비게이션 리스트 만들어주는 HTML 태그 -->
<nav class="navbar navbar-default">
		<%-- 네비게이션 헤더 --%>
		<!-- div : 웹 페이지에서 공간을 지정하는 HTML 태그 (가로 전체) -->
		<div class = "navbar-header">
				<!--button : 버튼을 만들어 주는 HTML 태그 -->
				<button type = "button" class = "navbar-toggle collapsed"
				 	data-toggle = "collapse" data-target = "#bs-navbar-collapse"
				 	arai-expaned = "false">
				 	<!-- span :  웹 페이지에서 공간을 지정하는 HTML 태그 (컨텐츠 사이즈 가로)-->
				 	<span class = "icon-bar"></span>
				 	<span class = "icon-bar"></span>
				 	<span class = "icon-bar"></span>
				 </button>
				 <!--  a : url을 이동 시켜주는 태그 href = "" 속성에 경로 지정 -->
				 <a class = "navbar-brand" href = "<%= request.getContextPath() %>/home">JSP 게시판</a>
		</div>
		<%-- 네비게이션 헤더 종료 --%>
		
		<%--  네비게이션 메뉴 --%>
		<div class="collapse navbar-collapse" id = "bs-navbar-collapse">
				<!-- 
					ol : order list -- 순서가 있는 리스트를 만들어 주는 태그
					ul : unorder list -순서가 없는 리스트를 만들어 주는 태그
				 -->
				 
				 <%-- 메인 메뉴 --%>
				<ul class = "nav navbar-nav">
						<!-- li : 리스트는 하나의 요소를 만들어 주는 태그 -->
						<li><a href="<%= request.getContextPath() %>/home">메인</a></li>
						<li class="active"><a href = "<%= request.getContextPath() %>/bbs">게시판</a></li>	
				</ul>
				<%-- 메인 메뉴 종료 --%>
				
				<%-- 마이 페이지 메뉴 --%>
				<!-- 로그인이 되있지 않을 때 표시 -->
				<%
						// 아이디가 입력 받지 않았을때
						if(user_id == null) {
				%>
				<ul class = "nav navbar-nav navbar-right">
						<li class = "dropdown">
								<a href = "#" class = "dropdown-toggle"
										data-toggle = "dropdown" role="button"
										aria-haspopup="true" aria-expanded = "false ">
										 마이페이지<span class = "caret"></span>							
								</a>
								<ul class = "dropdown-menu">
										<li><a href = "<%= request.getContextPath() %>/home/login">로그인</a></li>
										<li><a href = "<%= request.getContextPath() %>/home/join">회원가입</a></li>
								</ul>
						</li>
				</ul>
				<%
					// 아이디가 입력 받았을때
					} else {
				%>
				 <!-- 로그인이 되었을 때 표시 -->
				<ul class = "nav navbar-nav navbar-right">
						<li class = "dropdown">
								<a href = "#" class = "dropdown-toggle"
										data-toggle = "dropdown" role="button"
										aria-haspopup="true" aria-expanded = "false ">
										 마이페이지<span class = "caret"></span>							
								</a>
								<ul class = "dropdown-menu">
										<li><a href = "<%= request.getContextPath() %>/home/logout">로그아웃</a></li>
								</ul>
						</li>
				</ul>
				<%} %>
				<%-- 마이페이지 메뉴 종료 --%>
				
		</div>
		<%-- 네비게이션 메뉴 종료  --%>
		
</nav>
<%-- 메인 네비게이션 종료 --%>

<%-- 글쓰기 양식 --%>
<div class = "container">
		<div class = "row">
				<form method = "POST" action = "./writeAction">
						<table class = "table table-striped" style = "text-align: center; border: 1px solid #bbb;">
								<thead>
										<tr>
												<th style = "background-color: #eeeeee; text-alifn: center;">게시판 글쓰기 양식</th>
										</tr>
								</thead>
								<tbody>
										<tr>
												<td><input type = "text" class = "form-control" id="title" palceholder = "글 제목" name = "title" maxlength = "50"></td>
										</tr>
										<tr>			<!-- textarea : 장문의 문자를 입력 받는 HTML 입력태그 -->
												<td ><textarea class = "form-control" placeholder = "글 내용" id="contents" name = "contents" style = "height: 350px;"></textarea></td>
										</tr>
										<tr>
											<td><input type="file" class="form-control" id="file" placeholder="첨부파일" name="file"></td>
										</tr>
								</tbody>
						</table>
						<input type = "submit" class = "btn btn-primary pull-right" value = "글쓰기">
				</form>
		</div>
</div>
<%-- 글쓰기 양식 종료 --%>

</body>
</html>