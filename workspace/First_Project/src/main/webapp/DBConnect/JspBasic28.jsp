<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="department.DepartmentDAO" %>
<%
	request.setCharacterEncoding("UTF-8");

	String dept_id = request.getParameter("dept_id");
	
	DepartmentDAO dao = new DepartmentDAO();
	int rs = dao.departmentDelete(dept_id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= dept_id %> 데이터 삭제</title>
</head>
<body>

<%
	if(rs == 0) {
%>
<h4>삭제에 성공했습니다.</h4>
<%
	} else if(rs == 1) {
%>
<h4>삭제에 실패했습니다.</h4>
<%
	}
%>

</body>
</html>