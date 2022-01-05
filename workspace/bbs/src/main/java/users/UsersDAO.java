
package users;

import java.sql.*;

import util.Database;

// Users 테이블과 관련된 데이터베이스 접근 객체 생성을 위한 클래스
public class UsersDAO {

	private Connection con = null;					// 콘넥션 멤버 객체 선언
	private PreparedStatement pstmt = null; 	// statement 멤버 객체 선언
	private ResultSet rs = null;						// ResultSet 멤버 객체 선언
	private String sql = null;										// sql문을 저장 할 멤버 변수 선언
	
	// UserDAO 생성자
	public UsersDAO() {
		con = Database.oracleConnect();
	}
	
	// 회원가입 기능 메소드
	// parameter : Users
	// return : 성공 -> 0, 아이디중복(데이터베이스 오류) -> -1
	public int join(Users user) {
		
		// 반환 할 int 변수 선언
		int result = 0;
		// SQL문 초기화
		sql = "INSERT INTO USERS VALUES (?, ?, ?, ?, ?)";
		// SELECT sql 실행 시도
		try {
			
			// sql문 작성
			pstmt = con.prepareStatement(sql);
			// sql문 완성
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserPw());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			
			// statement에 작성된 sql문 실행
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
			// 예외발생 시 반환값을 -1로 반환
			result = -1;
		} finally {
			// 사용한 자원 반납
			Database.close(con, pstmt);
		}
		
		return result;
	}
	
	// 로그인 기능에 메소드
	// parameter : Users
	// return : 0 - 로그인 성공, 1 - 로그인 정보 불일치, -1 - 데이터베이스 오류
	public int login(Users users) {
		
		// 반환할 int 선언
		int result = 0;
		// USERS 테이블에 해당 userID, userPassword 값에 대한 행이 존재하는지 검사하는 sql문 작성
		sql = "SELECT * FROM USERS WHERE userID = ? AND userPassword = ? ";
		
		try {
			// statement에 sql문 작성
			pstmt = con.prepareStatement(sql);
			// sql문 완성
			pstmt.setString(1, users.getUserId());
			pstmt.setString(2, users.getUserPw());
			
			// sql문 실행
			// SELECT sql문 이라서 ResultSet 으로 받음, executeQuery() 사용
			rs = pstmt.executeQuery();
			
			// ResultSet에 다음 커서가 존재하지 않을 경우
			// (검색결과가 없음) - 로그인 정보 불일치
			if (!rs.next()) {
				result = 1;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			// 데이터베이스 오류
			result = -1;
		} finally {
			Database.close(con, pstmt, rs);
		}
		
		return result;
		
	}
	
}
