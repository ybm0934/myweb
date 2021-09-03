<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String[] name = request.getParameterValues("name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p><%=name[0] %></p>	
	<p><%=name[1] %></p>	
	<p><%=name[2] %></p>	
</body>
</html>