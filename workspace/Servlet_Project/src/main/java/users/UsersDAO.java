package users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;

import util.Database;

public class UsersDAO {

	private Connection con = null;

	public UsersDAO() {
		// 생성되자마자 Database 패키지에 getCon()을 불러오겠다.
		con = Database.getCon();
	}
	
	// 회원가입 처리 메소드
	// parameter : Users 객체
	// return : 0 - 성공, -1 - 실패
	public int join(Users users) {
			
		int result = 0;
		
		final String SQL = "INSERT INTO USERS VALUES(?, ?, ?, ?, ?, ?)";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, users.getUser_id());
			pstmt.setString(2, users.getUser_pw());
			pstmt.setString(3, users.getUser_name());
			pstmt.setString(4, users.getUser_gender());
			pstmt.setString(5, users.getUser_email());
			pstmt.setString(6, users.getUser_addr());
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
			result = -1;
		}
		
		return result;
	}
	
	// 로그인 처리 메소드
	// parameter	: 유저 아이디, 유저 패스워드
	// return		: { 	 0 	: 성공
	//							 1 	: 로그인정보 불일치
	//							-1	: 데이터베이스 오류
	public int login(String user_id, String user_pw) {
		
		int result = 0;
		
		final String SQL = "SELECT * FROM USERS WHERE user_id = ? AND user_pw = ?";
		
		try {
			
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, user_id);
			pstmt.setString(2, user_pw);
			
			ResultSet rs = pstmt.executeQuery();
		
			// 회원정보가 없을때.
			if (!rs.next()) result = 1;
			
			
		} catch(Exception e) {
			// 데이터베이스 오류
			e.printStackTrace();
			result = -1;
		}
		
		return result;
		
	}
	
	// 중복체크 처리 메서드
	// parameter	:유저 아이디
	// return		: { 
	//						0 	: 사용 가능
	//						1 	: 사용 중
	// 					   -1 	: 데이터베이스 오류
	//						}
	
	public int idCheck(String user_id) {
		int result = 0;
		
		final String SQL = "SELECT * FROM USERS WHERE user_id = ?";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, user_id);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) result = 1;
			
		} catch (Exception e) {
			e.printStackTrace();
			result = -1;
		}
		
		return result;
	}
	
}