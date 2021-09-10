<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sub.jsp</h1>
<%
	String str2 = "jsp";
	String str = request.getParameter("str");
	String temp = request.getParameter("temp");
%>
<h3 style="color:red;">sub.jsp에서 출력한 문장A</h3>
<h3 style="color:red;">sub.jsp에서 출력한 str2의 값 : <%=str2 %></h3>
<h3 style="color:green;">super.jsp에서 출력한 str의 값 : <%=str %></h3>
<h3 style="color:green;">넘어온 temp 파라미터의 값 : <%=temp %></h3>
<h3 style="color:red;">sub.jsp에서 출력한 문장B</h3>
</body>
</html>