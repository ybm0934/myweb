<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>beanTest_ok.jsp</h1>
	<jsp:useBean id="btest" class="yong.bean.BeanTest" />
	<jsp:setProperty property="*" name="btest" />
	<jsp:setProperty property="*" name="btest" />
	<h2>이름 : <jsp:getProperty property="name" name="btest"/></h2>
	<h2>나이 : <jsp:getProperty property="age" name="btest"/></h2>
	<h2>전화 : <%=btest.getTel() %></h2>
	<h2>주소 : <%=btest.getAddr() %></h2>
</body>
</html>