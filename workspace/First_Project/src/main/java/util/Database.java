package util;

import java.sql.*;

// Database 관련 class
public class Database {
	
	public static Connection oracleConnect() {
		
		Connection con = null;
		
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String id = "dba_user";
		String pw = "1234";
		
		try {
			
			// jdbc 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 데이터베이스 접속
			con = DriverManager.getConnection(url, id, pw);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	// executeQuery 사용 후 객체 close 메소드
	public static void close(ResultSet rs, PreparedStatement pstmt, Connection con) {
		try {
			if(rs != null) rs.close();
			if(pstmt != null)pstmt.close();
			if(con != null)con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	// executeUpdate 사용 후 객체 close 메소드
	public static void close(PreparedStatement pstmt, Connection con) {
		try {
			if(pstmt != null)pstmt.close();
			if(con != null)con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
