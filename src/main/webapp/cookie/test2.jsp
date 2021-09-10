<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] crr = request.getCookies();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	if(crr != null) {
		for(int i = 0; i < crr.length; i++) {
			String key = URLDecoder.decode(crr[i].getName());
			String value = URLDecoder.decode(crr[i].getValue());
%>
	<h3><%=key %> : <%=value %></h3>
	<hr>
<%
		}
	}	
%>
</body>
</html>