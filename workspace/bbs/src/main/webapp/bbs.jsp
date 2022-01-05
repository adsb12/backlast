<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.*" %>
<%@ page import="java.util.ArrayList" %>
<%
	// 로그인 되었을 때 해당 유저의 id가 저장될 변수
	String userId = null;

	// 세션에 "userId" 이름을 가지는 value가 존재하면 
	// userId 변수에 해당 value를 저장
	// 로그인 상태 확인
	if(session.getAttribute("userId") != null) {
		userId = (String) session.getAttribute("userId");
	}
	
	// 게시판 목록의 페이지 번호
	int pageNumber = 1;
	// 'pageNumber'라는 파라미터가 존재하면 해당 파라미터 값으로 pageNumber 지정
	if(request.getParameter("pageNumber") != null) {
		// 문자열을 정수형으로 바꾸기 위해 Integer Wrapper class 사용 (parse~~ 메소드)
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
<style>
	a, a:hover {
		color: #000000;
		text-decoration:none;
	}
</style>
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

<!-- 메인 게시판 -->
<div class="container">
	<div class="row">
		<table class="table table-striped" style="text-align:center; border:1px solid #bbbbbb">
			<thead>
				<tr>
					<th style="background-color:#dddddd; text-align:center;">번호</th>
					<th style="background-color:#dddddd; text-align:center;">제목</th>
					<th style="background-color:#dddddd; text-align:center;">작성자</th>
					<th style="background-color:#dddddd; text-align:center;">작성일</th>
				</tr>
			</thead>
			<tbody>
			<%
				// BBs DataAccessObject 객체 생성
				BbsDAO dao = new BbsDAO();
				// 게시물 목록 받아옴
				ArrayList<Bbs> list = dao.getList(pageNumber, dao.nextBbsID());
				// 목록 갯수 만큼 반복해서 각 요소를 출력
				for(int i = 0; i < list.size(); i++) {
			%>
				<tr>
					<td><%= list.get(i).getBbsID() %></td>
					<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("/n", "<br>") %></a></td>
					<td><%= list.get(i).getUserID() %></td>
					<td><%= list.get(i).getBbsDate() %></td>
				</tr>
			<%
				}
			%>
			</tbody>
		</table>
		
		<%
			if(pageNumber != 1){
		%>
		<%-- GET 방식 전송 : URL?파라미터=데이터&파라미터=데이터 --%>
		<a href="bbs.jsp?pageNumber=<%= pageNumber - 1 %>" class="btn btn-success btn-arrow-left">이전</a>
		<%
			}
			if(dao.isNextPage(pageNumber + 1, dao.nextBbsID())) {
		%>
		<a href="bbs.jsp?pageNumber=<%= pageNumber + 1 %>" class="btn btn-success btn-arrow-left">다음</a>
		<%
			}
		%>
		
		<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
	</div>
</div>
<!-- 메인 게시판 종료 -->

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>