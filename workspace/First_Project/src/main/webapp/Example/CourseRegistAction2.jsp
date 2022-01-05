<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="course.CourseBean, course.CourseDAO"%>
<jsp:useBean id="course"  scope="page" class="course.CourseBean"/>
<jsp:setProperty name="course" property="course_id"/>
<jsp:setProperty name="course" property="title"/>  
<jsp:setProperty name="course" property="c_number"/>  
<jsp:setProperty name="course" property="professor_id"/>  
<jsp:setProperty name="course" property="course_fees"/>      
<%
	request.setCharacterEncoding("UTF-8");

	// 메소드에 전송할 bean 객체 매개변수 생성
	// CourseBean bean = new CourseBean();

	// bean 객체를 받아온 parameter 값으로 초기화
	// bean.setCourse_id(request.getParameter("course_id"));
	// bean.setTitle(request.getParameter("title"));
	// String c_number_s = getParameter("c_number");
	// int c_number = Integer.parseInt(c_number_s);
	// bean.setC_number(c_number);
	// bean.setC_number(Integer.parseInt(request.getParameter("c_number")));
	
	// String professor_id = request.getParameter("professor_id");
	// bean.setProfessor_id(professor_id);
	
	// String course_fees_s = request.getParameter("course_fees");
	// int course_fees = Integer.parseInt(course_fees_s);
	// bean.setCourse_fees(course_fees);
	
	// dao 객체를 생성하고 그 객체의 메소드를 사용해서 database access를 해줌
	CourseDAO dao = new CourseDAO();
	int rs = dao.courseRegist(course);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if(rs == 0) { %>
<h4>삽입에 성공했습니다.</h4>
<%	} else if(rs == -1) { %>
<h4>삽입에 실패했습니다.</h4>
<% } %>

</body>
</html>