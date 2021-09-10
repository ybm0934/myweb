<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String key = "이름";
	String value = "홍길동";
	key = URLEncoder.encode(key);
	value = URLEncoder.encode(value);

	Cookie c1 = new Cookie(key, value);
	c1.setMaxAge(15);
	response.addCookie(c1);
	
	Cookie c2 = new Cookie("age", "34");
	c2.setMaxAge(20);
	response.addCookie(c2);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="fm" action="/myweb/cookie/test2.jsp">
		<input type="submit" value="GO">
	</form>
</body>
</html>