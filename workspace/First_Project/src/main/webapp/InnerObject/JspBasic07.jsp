<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    buffer="10kb"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp 내장객체</title>
</head>
<body>

<!-- 
버퍼의 크기를 10K Byte로 선언하고,
출력버퍼 크기와 이용할 수 있는 출력버퍼의 크기, 사용된 출력버퍼의 크기를 출력
 -->
 
 <h2> out 내장객체 </h2>
 <%
 	int buff = out.getBufferSize();
 	int notused =  out.getRemaining();
 	
 	out.println("<p> 출력버퍼 : " + buff + " Byte </p>");
 	out.println("<p> 이용가능 버퍼 : " + notused + " Byte </p>");
 	out.println("<p> 사용한 버퍼 : " + (buff - notused) + " Byte </p>");
 %>

</body>
</html>