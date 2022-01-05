<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	String course_id = request.getParameter("course_id");
	String title = request.getParameter("title");
	
	String c_number_s = request.getParameter("c_number");
	int c_number = Integer.parseInt(c_number_s);
	// int c_number = Integer.parseInt(request.getParameter("c_number"));
	
	float c_number_f = Float.parseFloat(c_number_s);
	
	// c_number_s = (String) c_number;
	c_number_s = Integer.toString(c_number);
	// c_number_s = Float.toString(c_number_f);
	
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String db_id = "dba_user";
	String db_pw = "1234";
	
	
	String sql = "INSERT INTO COURSE(course_id, title, c_number) VALUES(?, ?, ?)";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection(url, db_id, db_pw);
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, course_id);
		pstmt.setString(2, title);
		pstmt.setInt(3, c_number);
		// pstmt.setString(3, c_number_s);
		
		pstmt.executeUpdate();
		
		if(pstmt != null) pstmt.close();
		if(con != null) con.close();
%>
<h4>삽입 완료</h4>
<%
	} catch(Exception e) {
		e.printStackTrace();
%>
<h4>삽입 실패</h4>
<%
	}
%>
</body>
</html>