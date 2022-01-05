<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="course.CourseBean" %>
<%@ page import="course.CourseDAO" %>
<%@ page import="java.util.ArrayList" %>
<%
	// CourseDAO 객체 생성
	CourseDAO dao = new CourseDAO();
	// dao 객체에서 Course 테이블 검색결과 반환
	ArrayList<CourseBean> list = dao.courseList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과목 리스트</title>
</head>
<body>
<% if(list != null) {%>
<h4>과목 검색 결과</h4>
<table border="1">
	<tr>
		<th>과목 번호</th>
		<th>과목명</th>
		<th>학점</th>
		<th>교수 번호</th>
		<th>추가 수강료</th>
	</tr>
	<% for(int i = 0; i < list.size(); i++) { %>
	<tr>
		<td><%= list.get(i).getCourse_id() %></td>
		<td><%= list.get(i).getTitle() %></td>
		<td><%= list.get(i).getC_number() %></td>
		<td><%= list.get(i).getProfessor_id() %></td>
		<td><%= list.get(i).getCourse_fees() %></td>
	</tr>
	<% } %>
</table>
<% } else { %>
<h4>검색에 실패했습니다.</h4>
<% } %>
</body>
</html>