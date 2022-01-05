package authmail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.Database;

public class AuthmailDAO {

	private Connection con;

	public AuthmailDAO() {
		con = Database.getCon();
	}

	// 메일 주소에 해당하는 인증번호를 저장하는 메소드
	// parameter : 이메일 주소, 인증 번호
	// return : { 0 : 성공, -1 : 실패 }
	public int setAuthnum(Authmail authmail) {

		int result = 0;

		final String SQL = "INSERT INTO AUTHMAIL VALUES(?, ?)";

		try {

			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, authmail.getEmail());
			pstmt.setInt(2, authmail.getAuth_num());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			result = -1;
		}

		return result;

	}

	// 인증 번호 재전송시 해당 이메일 주소에 값을 가지는 인증번호 수정하는 메소드
	// parameter : 이메일 주소, 인증번호
	// return : { 0 : 성공, -1 : 실패 }
	public int resetAuthnum(Authmail authmail) {

		int result = 0;

		final String SQL = "UPDATE AUTHMAIL SET auth_num = ? WHERE email =?";

		try {

			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, authmail.getAuth_num());
			pstmt.setString(2, authmail.getEmail());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			result = -1;
		}

		return result;
	}

	// 입력한 인증번호를 확인하는 메소드
	// parameter : 이메일 주소, 인증번호
	// return : { 0 : 성공, 1 : 인증 실패, -1 : 데이터베이스 오류 }
	public int getAuthnum(Authmail authmail) {

		int result = 0;

		final String SQL = "SELECT * FROM AUTHMAIL WHERE email = ? AND auth_num = ?";

		try {

			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, authmail.getEmail());
			pstmt.setInt(2, authmail.getAuth_num());

			ResultSet rs = pstmt.executeQuery();

			// 인증번호가 틀릴 때
			if (!rs.next()) result = 1;

		} catch (Exception e) {
			// 데이터베이스 오류
			e.printStackTrace();
			result = -1;
		}

		return result;

	}

}
