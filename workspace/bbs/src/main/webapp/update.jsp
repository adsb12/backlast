<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.*" %>
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
	
	// 게시물 번호 parameter를 저장할 변수 선언
	int bbsID = 0;
	// parameter에 'bbsID'라는 파라미터가 존재하는지 검사
	if(request.getParameter("bbsID") != null){
		// 존재한다면 bbsID 변수에 파라미터 값 저장
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	// bbsID가 0이면
	if(bbsID == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('적절한 게시물 번호가 아닙니다.')");
		script.println("location.href = 'bbs.jsp';");
		script.println("</script>");
	}
	
	// BBs 테이블 DataAccessObject 생성
	BbsDAO dao = new BbsDAO();
	// 게시글 내용 불러오기
	Bbs bbs = dao.getBbs(bbsID);
	
	// bbs 객체가 null을 반환 받았을 때 (존재하지 않는 게시글 일 때)
	if(bbs == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 게시물입니다.')");
		script.println("location.href = 'bbs.jsp';");
		script.println("</script>");
	}
	
	// bbs 객체의 available의 값이 1이면 삭제된 게시물임
	if(bbs.getBbsAvailable() == 1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('삭제된 게시물입니다.')");
		script.println("location.href = 'bbs.jsp';");
		script.println("</script>");
	}
	
	// 게시물 작성자와 로그인 유저가 같은지 검사
	if(!userId.equals(bbs.getUserID())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('작성자만 수정할 수 있습니다.')");
		script.println("location.href = 'bbs.jsp';");
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
		<form method="post" action="updateAction.jsp">
			<input type="hidden" name="bbsID" value="<%= bbs.getBbsID() %>">
			<table class="table table-striped" style="text-align: center; border: 1px solid #bbbbbb;">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;"><%= bbs.getBbsID() %>게시물</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="whidth:20%;">제목</td>
						<td><input type="text" class="form-control" name="bbsTitle" value="<%= bbs.getBbsTitle() %>"></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input type="hidden" name="userID" value="<%= bbs.getUserID() %>"><%= bbs.getUserID() %></td>
					</tr>
					<tr>
						<td>작성일</td>
						<td><%= bbs.getBbsDate() %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea class="form-control" name="bbsContent" style="height:350px;"><%= bbs.getBbsContent() %></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-warning" value="수정">
		</form>
	</div>
</div>
<!-- 글쓰기 양식 종료 -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>