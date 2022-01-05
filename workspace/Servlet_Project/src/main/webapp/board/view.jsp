<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<title>JSP 게시판</title>
<meta http-equiv="Conetent-Type" content = "text/html; charset = UTF-8">
<meta name="viewport" content = "width=device-width" initial-scale = "1">
<link rel = "stylesheet" href = "<%= request.getContextPath() %>/css/bootstrap.css" >
<link rel = "stylesheet" href = "<%= request.getContextPath() %>/css/custom.css">
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
				<c:if test="${empty user_id}">
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
				</c:if>
				<c:if test="${not empty user_id }">
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
				</c:if>
				<%-- 마이페이지 메뉴 종료 --%>
				
		</div>
		<%-- 네비게이션 메뉴 종료  --%>
		
</nav>
<%-- 메인 네비게이션 종료 --%>

<%-- 글쓰기 양식 --%>
<div class = "container">
		<div class = "row">
				<form method = "POST" action = "writeAction.jsp">
						<table class = "table table-striped" style = "text-align: center; border: 1px solid #bbb;">
								<thead>
										<tr>
												<th colspan = "2" style = "background-color: #eeeeee; text-alifn: center;">게시물</th>
										</tr>
								</thead>
								<tbody>
										<tr>
												<!-- 맨 처음 요소 스타일 지정시 따라간다. -->
												<td style = "width: 20%;">제목</td>
												<!-- HTML 태그를 문자로 바꿀 때 -->
												<!--	★★★  XSS 방지 ★★★	-->
												<!-- XSS : 크로스 사이트 스크립트 취약점 -->
												
												<!-- '  ' 	-> 	&nbsp;	-->
												<%-- └ 바꿀때 = 문자열.replaceAll("'공백'", "&nbsp;") --%>
												
												<!-- '<' 	-> 	&lt;		-->
												<%-- └ 바꿀때 = 문자열.replaceAll(" < ", "&lt;") --%>
												
												<!-- '>'		-> 	&gt;		-->
												<%-- └ 바꿀때 = 문자열.replaceAll(" > ", "&gt;") --%>
												
												<!-- '/n		-> 	'<br>'	-->
												<%-- └ 바꿀때 = 문자열.replaceAll(" /n ", "<br>") --%>
												
												<td>${boarder.title}</td>
										</tr>
										<tr>
												<td>작성자</td>
												<td>${boarder.writer}</td>
										</tr>
										<tr>
												<td>작성일</td>
												<td>${boarder.reg_date}</td>
										</tr>
										<tr>
												<td>내용</td>
												<td style= "min-height: 200px; text-align: left;">${boarder.contents}</td>
										</tr>
								</tbody>
						</table>
						<a href = "../bbs" class="btn btn-default">목록</a>		<!-- ↓ 매우 유용 -->
						<c:if test="${user_id eq boarder.writer}">
						<a href = "./update?boarder_id=${boarder.boarder_id}" class="btn btn-success">수정</a>			
						<a onclick = "return confirm('정말 삭제하시겠습니까?')" href = "./deleteAction?boarder_id=${boarder.boarder_id}" class="btn btn-danger">삭제</a>			
						<!-- ↑ onclick : a 태그를 클릭하면 -->
						</c:if>						
				</form>
		</div>
</div>
<%-- 글쓰기 양식 종료 --%>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src= "<%= request.getContextPath() %>/js/bootstrap.js"></script>
</body>
</html>