<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 1. java.sql.* import --%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

	// 2. 사용할 DBMS - JDBC Driver 로드
	Class.forName("oracle.jdbc.driver.OracleDriver");

	// 3. 데이터 베이스 접속
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String db_id = "dba_user";
	String db_pw = "1234";
	Connection con = DriverManager.getConnection(url, db_id, db_pw);
	
	// 4. Connection 으로 SQL문 생성
	Statement stmt = con.createStatement();
	PreparedStatement pstmt = con.prepareStatement("SELECT * FROM DEPARTMENT WHERE dept_id = ? ~ ?");
	pstmt.setString(1, "aa");
	pstmt.setInt(2, 1);
	
	// 5. SQL문 실행
	stmt.executeQuery("SELECT * FROM DEPARTMENT");
	stmt.executeUpdate("INSERT or UPDATE or DELETE");
	
	pstmt.executeQuery();
	pstmt.executeUpdate();
	
	// 6. SQL문 결과 처리
	ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()) {
		String dept_id = rs.getString(1);
		String dept_tel = rs.getString(3);
	}
	
	// 7. 연결 해제
	// 생성 순서 반대순으로
	rs.close();
	pstmt.close(); stmt.close();
	con.close();
	
%>

</body>
</html>