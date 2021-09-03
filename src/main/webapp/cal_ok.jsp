<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="test/css/mainLayout.css">
<style>
	#cal-div {
		text-align: center;
		margin: 50px 0 50px 0;
	}
</style>
<%
	double num1 = Double.parseDouble(request.getParameter("num1"));
	String oper = request.getParameter("oper");
	double num2 = Double.parseDouble(request.getParameter("num2"));
	double result = 0;
	
	if(oper.equals("+")){
		result = num1 + num2;
	}else if(oper.equals("-")){
		result = num1 - num2;
	}else if(oper.equals("*")){
		result = num1 * num2;
	}else if(oper.equals("/")){
		result = num1 / num2;
	}
	
	result = Math.round(result * 100.0) / 100.0;
%>
</head>
<body>
<%@ include file="header.jsp"%>
	<div id="cal-div">
	<h1>사칙 계산기</h1>
		<div id="cal-div-1">
			<h3>입력하신 값1 : <%=num1 %></h3>
			<h3>입력하신 연산 : <%=oper %></h3>
			<h3>입력하신 값2 : <%=num2 %></h3>		
			<h3>계산 결과 : <%=result %></h3>		
		</div>
	</div>
<%@ include file="footer.jsp"%>
</body>
</html>