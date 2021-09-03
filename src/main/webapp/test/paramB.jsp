<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>
 <h1>paramB.jsp</h1>
 <form name="paramB" action="test/paramC.jsp">
 <input type="hidden" name="name" value="<%=name %>">
 <input type="hidden" name="age" value="<%=age %>">
 전화번호 : <input type="text" name="tel"><br>
 주소 : <input type="text" name="addr"><br>
 <input type="submit" value="전달하기">
 </form>
</body>
</html>