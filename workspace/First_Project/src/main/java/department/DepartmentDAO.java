package department;

import java.sql.*;
import java.util.ArrayList;

public class DepartmentDAO {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	public DepartmentDAO() {
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String db_id = "dba_user";
		String db_pw = "1234";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, db_id, db_pw);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public int departmentInsert(String dept_id, String dept_name, String dept_tel) {
		
		sql = "INSERT INTO DEPARTMENT VALUES (?, ?, ?)";
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dept_id);
			pstmt.setString(2, dept_name);
			pstmt.setString(3, dept_tel);
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
			return 1;
		} finally {
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return 0;
		
	}
	
	public int departmentDelete(String dept_id) {
		
		sql = "DELETE FROM DEPARTMENT WHERE dept_id = ?";
		
		try{
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dept_id);
			
			pstmt.executeUpdate();

			
		} catch(Exception e) {
			e.printStackTrace();
			return 1;
			
		} finally {
			
			try {
				if(pstmt != null) pstmt.close();
				
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		return 0;
	}
	
	public ArrayList<DepartmentBean> departmentList() {		
		
		/*
		ArrayList<Integer> li = new ArrayList<Integer>(10);
		li.add(1);
		li.add("hi");
		*/
		
		ArrayList<DepartmentBean> list = new ArrayList<DepartmentBean>();
		sql = "SELECT * FROM DEPARTMENT";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				DepartmentBean bean = new DepartmentBean();
				
				bean.setDept_id(rs.getString(1));
				bean.setDept_name(rs.getString(2));
				bean.setDept_tel(rs.getString(3));
				
				list.add(bean);
			}
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return list;
		
	}
	
}
