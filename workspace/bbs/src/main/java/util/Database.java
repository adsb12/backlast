package util;

import java.sql.*;

// 데이터베이스와 관련된 기능을 모아둔 클래스
public class Database {
	
	// 오라클 127.0.0.1:1521:xe, dba_user 접속하는 메소드
	public static Connection oracleConnect() {
		
		// 반환할 Connection 객체 선언
		Connection con= null;
		
		// 상수형태로 데이터베이스 url, 데이터베이스 사용자 id, 데이터베이스 사용자 패스워드 선언 및 초기화
		final String URL = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		final String ID = "dba_user";
		final String PW = "1234";
		
		// 데이터베이스 접속 시도
		try {
			// 오라클 jdbc 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 127.0.0.1:1521:xe에 접속
			con = DriverManager.getConnection(URL, ID, PW);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return con;
		
	}
	
	// executeUpdate 실행 후 close 메소드
	public static void close(Connection con, PreparedStatement pstmt) {
		
		try {
			if(pstmt != null) pstmt.close(); // preparestatement close
			if(con != null) con.close();		// connection close
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// executeQuery 실행 후 close 메소드
	public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		try {
			if(rs != null) rs.close();				// resultset close
			if(pstmt != null) pstmt.close(); // preparestatement close
			if(con != null) con.close();		// connection close
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
