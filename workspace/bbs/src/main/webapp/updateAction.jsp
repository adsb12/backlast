<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%-- update.jsp 페이지로 부터 파라미터를 받아와서 bean 객체 생성 및 초기화 --%>
<%-- bbsID : 게시물 번호 --%>
<%-- bbsTitle : 게시물 제목 --%>
<%-- bbsContent : 게시물 내용 --%>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsID"/>
<jsp:setProperty name="bbs" property="bbsTitle"/>
<jsp:setProperty name="bbs" property="bbsContent"/>
<jsp:setProperty name="bbs" property="userID"/>
<% 
	String userId = null;
	if(session.getAttribute("userId") != null) {
		userId = (String) session.getAttribute("userId");
	}
	
	if(userId == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'main.jsp';");
		script.println("</script>");
	}
	
	if(bbs.getBbsID() == 0 || bbs.getBbsTitle() == null || bbs.getBbsContent() == null || bbs.getUserID() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('올바르지 않은 접근입니다.');");
		script.println("location.href = 'bbs.jsp';");
		script.println("</script>");
	}
	
	if(!userId.equals(bbs.getUserID())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('작성자만 수정 가능합니다.');");
		script.println("location.href = 'bbs.jsp';");
		script.println("</script>");
	}
	
	BbsDAO dao = new BbsDAO();
	
	int result = dao.update(bbs);
	
	if(result == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'view.jsp?bbsID=" + bbs.getBbsID() + "';");
		script.println("</script>");
	}
	else if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('실패했습니다.');");
		script.println("history.back();");
		script.println("</script>");
	}
	
%>