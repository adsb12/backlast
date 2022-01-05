<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Calendar" %>
    <%@ page import="java.util.GregorianCalendar" %>
    <%@ page import="java.util.Date" %>
    <%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<%!
	Calendar c1 = Calendar.getInstance();
	Calendar c2 = new GregorianCalendar();
	
	Date date1 = new Date();
	Date date2 = new Date();
%>
<html>
<head>
<meta charset="UTF-8">
<title>날짜 유틸</title>
</head>
<body>
<table border="1">
	<tr>
		<td>c1</td>
		<td><%= c1.toString() %></td>
	</tr>
	<tr>
		<td>c2</td>
		<td><%= c2.toString() %></td>
	</tr>
</table>

<% 
	c2.set(Calendar.YEAR, 2020);
	c2.set(Calendar.MONTH, 0);
%>

<p> <%= c1.get(Calendar.YEAR) %> <%= c1.get(Calendar.MONTH) + 1 %> <%= c1.get(Calendar.DATE) %></p> 
<p> <%= c1.get(Calendar.DAY_OF_WEEK) %></p>

<p> <%= c2.get(Calendar.YEAR) %> <%= c2.get(Calendar.MONTH) + 1 %> <%= c2.get(Calendar.DATE) %></p> 
<p> <%= c2.get(Calendar.DAY_OF_WEEK) %></p>

<%
	c2.set(2022, 11, 25);
%>

<p> <%= c2.get(Calendar.YEAR) %> <%= c2.get(Calendar.MONTH) + 1 %> <%= c2.get(Calendar.DATE) %></p> 
<p> <%= c2.get(Calendar.DAY_OF_WEEK) %></p>

<%! long diff = c2.getTimeInMillis() - c1.getTimeInMillis(); %>

<h3> <%= (c2.getTimeInMillis() - c1.getTimeInMillis()) / (24*60*60*1000) %></h3>

<%
	date1 = c1.getTime();
	date2 = c2.getTime();
%>

<h3> <%= date1 %></h3>
<h3> <%= date2 %></h3>

<%
	c1.setTime(date2);
%>

<p> <%= c1.get(Calendar.YEAR) %> <%= c1.get(Calendar.MONTH) + 1 %> <%= c1.get(Calendar.DATE) %></p> 
<p> <%= c1.get(Calendar.DAY_OF_WEEK) %></p>
<p> <%= c2.get(Calendar.YEAR) %> <%= c2.get(Calendar.MONTH) + 1 %> <%= c2.get(Calendar.DATE) %></p> 
<p> <%= c2.get(Calendar.DAY_OF_WEEK) %></p>

</body>
</html>