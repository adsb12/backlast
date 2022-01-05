<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="department.DepartmentDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String dept_id = request.getParameter("dept_id");
	String dept_name = request.getParameter("dept_name");
	String dept_tel = request.getParameter("dept_tel");
	
	DepartmentDAO dao = new DepartmentDAO();
	
	int rs = dao.departmentInsert(dept_id, dept_name, dept_tel);
	
	if (rs == 0) {
%>
<h4>삽입에 성공했습니다.</h4>
<%
	} else if(rs == 1) {
%>
<h4>삽입에 실패했습니다.</h4>
<%
	}
%>
</body>
</html>