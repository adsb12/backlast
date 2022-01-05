<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
	String str = "첫번째 JSP";
	int sum = 0;
%>
<%!
	public int factorial(int n) {
	
		int rs = 1;
		for(int i = 1; i <= n; i++) {
			rs *= i;
	}
		return rs;
}
%>
<html>
<head>
<meta charset="UTF-8">
<title>선언부 및 표현식</title>
</head>
<body>
<p>str : <%= str %></p>
<p>sum : <%= sum %></p>
<p>5! : <%= factorial(5) %>

</body>
</html>