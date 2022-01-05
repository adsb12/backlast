<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>
<%
	try {
		// Context.xml을 읽어옴
		Context init = new InitialContext();
		
		// 읽어온 context.xml에서 해당 이름을 가진 리소스를 찾아옴
		DataSource ds = (DataSource) init.lookup("java:/comp/env/jdbc/oracle");
		
		// 찾아온 리소스에서 콘넥션을 가져옴
		Connection con = ds.getConnection();
		
		out.println("연결 성공");
		
	} catch(Exception e) {
		
		e.printStackTrace();
		out.println("연결 실패");
		
	}

%>