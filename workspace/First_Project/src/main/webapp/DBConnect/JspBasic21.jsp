<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	String dept_id = request.getParameter("dept_id");
	
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String db_id = "dba_user";
	String db_pw = "1234";
	String sql = "SELECT * FROM DEPARTMENT WHERE dept_id = ?";
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
		pstmt.setString(1, dept_id);
		
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			String dept_name = rs.getString(2);
			String dept_tel = rs.getString(3);
%>
<h4>학과 수정</h4>
<form method="post" action="JspBasic22.jsp">
	<table border="1">
		<tr>
			<td>학과 코드 : </td>
			<td><%= dept_id %><input type="hidden" name="dept_id" value="<%= dept_id %>"></td>
		</tr>
		<tr>
			<td>학과명 : </td>
			<td><input type="text" name="dept_name" value="<%= dept_name %>"></td>
		</tr>
		<tr>
			<td>전화번호 : </td>
			<td><input type="text" name="dept_tel" value="<%= dept_tel %>"></td>
		</tr>
		<tr align="center">
			<td colspan="2">
				<input type="submit" value="수정">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
</form>
<%			
		} else {
%>
<h4><%= dept_id %> 학과코드가 존재하지 않습니다.</h4>
<%
		}
		rs.close();
		pstmt.close();
		con.close();
	} catch(Exception e) {
		e.printStackTrace();
%>
<h4>데이터베이스 접속에 실패했습니다.</h4>
<%
	}
%>

</body>
</html>