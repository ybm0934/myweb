<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>super.jsp</h1>
<%
	String str = "java";
%>
<h3 style="color:blue;">super.jsp에서 출력한 문장A</h3>
<h3 style="color:blue;">super.jsp에서 출력한 str의 값 : <%=str %></h3>

<jsp:include page="sub.jsp">
	<jsp:param value="<%=str %>" name="str"></jsp:param>
</jsp:include>
<%-- <%@ include file="sub.jsp" %> --%>

<h3 style="color:blue;">super.jsp에서 출력한 문장B</h3>
</body>
</html>