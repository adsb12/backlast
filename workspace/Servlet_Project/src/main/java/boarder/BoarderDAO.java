package boarder;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.Database;

public class BoarderDAO {
	Connection con = null;
	
	public BoarderDAO() {
		con = Database.getCon();
	}
	
	// 다음 게시물 번호 가져오기 메소드
	// parameter : 없음
	// return : {다음 페이지 번호, -1 : 데이터베이스 오류 }
	public int next() {
		int result = 1;
		
		final String SQL = "SELECT NVL(MAX(boarder_id), 0) FROM BOARDER";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) result += rs.getInt(1);
			
		} catch(Exception e) {
			e.printStackTrace();
			result = -1;
		}
		
		return result;
	}
	
	// 글쓰기 메소드
	// parameter : boarder 객체
	// return : { 0 : 성공, -1 : 실패}
	public int write(Boarder boarder) {
		int result = 0;
		
		final String SQL = "INSERT INTO BOARDER VALUES (?, ?, ?, ?, SYSDATE, 0, 0)";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, boarder.getBoarder_id());
			pstmt.setString(2, boarder.getWriter());
			pstmt.setString(3, boarder.getTitle());
			pstmt.setString(4, boarder.getContents());
			
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
			result = -1;
		}
		
		return result;
	}
	
	// 게시물 불러오기 메소드
	// parameter : 게시물 번호
	// return : boarder 객체, null : 존재하지 않는 게시물 혹은 삭제된 게시물
	public Boarder getBoarder_id(int boarder_id) {
		Boarder boarder = null;
		
		final String SQL = "SELECT * FROM BOARDER WHERE boarder_id = ? AND available = 0";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, boarder_id);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				boarder = new Boarder();
				boarder.setBoarder_id(rs.getInt(1));
				boarder.setWriter(rs.getString(2));
				boarder.setTitle(rs.getString(3));
				boarder.setContents(rs.getString(4));
				boarder.setReg_date(rs.getString(5));
				boarder.setLikey(rs.getInt(6));
				boarder.setAvailable(rs.getInt(7));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return boarder;
	}
	
	// 게시물 목록 불러오기 메소드
	// parameter : 페이지 번호, 다음 게시물 번호
	// return : 게시물 리스트
	public ArrayList<Boarder> getBoarderList(int pageNum, int next) {
		ArrayList<Boarder> list = new ArrayList<Boarder>();
		
		final String SQL = "SELECT * FROM(SELECT * FROM BOARDER WHERE boarder_id < ? AND available = 0 ORDER BY boarder_id DESC) WHERE ROWNUM <= 10";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, next - (pageNum - 1) * 10);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Boarder boarder = new Boarder();
				boarder.setBoarder_id(rs.getInt(1));
				boarder.setWriter(rs.getString(2));
				boarder.setTitle(rs.getString(3));
				boarder.setContents(rs.getString(4));
				boarder.setReg_date(rs.getString(5));
				boarder.setLikey(rs.getInt(6));
				boarder.setAvailable(rs.getInt(7));
				
				list.add(boarder);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 게시물 수정 메소드
	// parameter : boarder 객체
	// return : { 0 : 성공, -1 : 실패 }
	public int update(Boarder boarder) {
		int result = 0;
		
		final String SQL = "UPDATE BOARDER SET title = ?, contents = ? WHERE boarder_id = ?";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, boarder.getTitle());
			pstmt.setString(2, boarder.getContents());
			pstmt.setInt(3, boarder.getBoarder_id());
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
			result = -1;
		}
		
		return result;
	}
	
		// 게시물 삭제 메소드
		// parameter : 게시물 번호
		// return : { 0 : 성공, -1 : 실패 }
	public int delete(int boarder_id) {
		int result = 0;
		
		final String SQL = "UPDATE BOARDER SET available = 1 WHERE boarder_id = ?";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, boarder_id);
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
			result = -1;
		}
		
		return result;
	}
	
	// 게시물의 총 갯수를 불러오는 메서드
	// parameter : 없음
	// return : 총 갯수를 반환, -1: 데이터베이스 오류
	public int getCount() {
		int result = -1;
		
		final String SQL = "SELECT count(*) FROM BOARDER WHERE available = 0";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) result = rs.getInt(1);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
