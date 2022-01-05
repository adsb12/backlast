<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	String dept_id = request.getParameter("dept_id");
	String dept_name = request.getParameter("dept_name");
	String dept_tel = request.getParameter("dept_tel");
	
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String db_id = "dba_user";
	String db_pw = "1234";
	
	String sql = "UPDATE DEPARTMENT SET dept_name = ?, dept_tel = ? WHERE dept_id = ?";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= dept_id %> 학과 정보 수정</title>
</head>
<body>

<%
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection(url, db_id, db_pw);
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, dept_name);
		pstmt.setString(2, dept_tel);
		pstmt.setString(3, dept_id);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
%>
<h4><%= dept_id %> 의 데이터를 <%= dept_name %>, <%= dept_tel %>로 변경했습니다.</h4>
<%
	} catch(Exception e) {
		e.printStackTrace();
%>
<h4>데이터베이스 수정에 실패했습니다.</h4>
<%
	}
%>

</body>
</html>