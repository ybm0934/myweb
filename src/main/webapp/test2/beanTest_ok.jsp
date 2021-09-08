<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String tel = request.getParameter("tel");
	String addr = request.getParameter("addr");
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
	
	<jsp:setProperty property="name" name="btest" value="홍길동" />
	<jsp:setProperty property="age" name="btest" value="20"/>
	
	<h2>이름 : <jsp:getProperty property="name" name="btest" /></h2>
	<h2>나이 : <%=btest.getAge() %></h2>
	
	<hr>
	
	<h1>beanTest.jsp</h1>
	<jsp:useBean id="btest2" class="yong.bean.BeanTest" />
	
	<jsp:setProperty property="name" name="btest2" value="<%=name %>"/>
	<jsp:setProperty property="age" name="btest2" value="<%=age %>"/>
	<jsp:setProperty property="tel" name="btest2" value="<%=tel %>"/>
	<jsp:setProperty property="addr" name="btest2" value="<%=addr %>"/>
	
	<h2>이름 : <jsp:getProperty property="name" name="btest2"/></h2>
	<h2>나이 : <jsp:getProperty property="age" name="btest2"/></h2>
	<h2>전화 : <%=btest2.getTel() %></h2>
	<h2>주소 : <%=btest2.getAddr() %></h2>
</body>
</html>