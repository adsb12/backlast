<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="department.DepartmentDAO" %>
<%@ page import="department.DepartmentBean" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학과 검색</title>
</head>
<body>

<%
	ArrayList<DepartmentBean> list = null;

	DepartmentDAO dao = new DepartmentDAO();
	list = dao.departmentList();
%>

<h4>DEPARTMENT 테이블</h4>
<table border="1">
	<tr>
		<th>순번</th>
		<th>학과코드</th>
		<th>학과 명</th>
		<th>전화번호</th>
	</tr>
<%
	if (list != null) {
		for (int i = 0; i <list.size(); i++) {
%>
			<tr>
				<td><%= i + 1 %></td>	
				<td><%= list.get(i).getDept_id() %></td>	
				<td><%= list.get(i).getDept_name() %></td>	
				<td><%= list.get(i).getDept_tel() %></td>
			</tr>	
<%
		}
	}
%>
</table>

</body>
</html>