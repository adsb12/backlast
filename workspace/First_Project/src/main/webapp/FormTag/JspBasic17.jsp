<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학과 검색</title>
</head>
<body>

<%
	String dept_id = request.getParameter("dept_id");
	int idx = 1;
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String db_id = "dba_user";
	String db_pw = "1234";
	
	String sql = "SELECT * FROM DEPARTMENT WHERE dept_id = ?";
	String sql2 = "SELECT * FROM DEPARTMENT WHERE dept_id = '" + dept_id + "'";
	
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection(url, db_id, db_pw);
		
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql2);
		
		/*
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, dept_id);
		
		ResultSet rs = pstmt.executeQuery();
		*/
%>

<h4>DEPARTMENT 테이블</h4>
<table border="1">
	<tr>
		<th>순번</th>
		<th>학과코드</th>
		<th>학과 명</th>
		<th>전화번호</th>
	</tr>
<%
		while(rs.next()) {
%>
	<tr>
		<td><%= idx++ %></td>
		<td><%= rs.getString(1) %></td>
		<td><%= rs.getString(2) %></td>
		<td><%= rs.getString(3) %></td>
	</tr>
<%
		}
%>
</table>
<h5>데이터베이스 검색 성공</h5>
<%
	} catch(Exception e) {
		e.printStackTrace();
%>
<h5>데이터베이스 검색 실패</h5>
<%
	}
%>
</body>
</html>