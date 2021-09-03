<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Request Test</title>
</head>
<body>
	<h1>requestTest.jsp</h1>
	<h3>사용자 IP : <%=request.getRemoteAddr() %></h3>
	<h3>사용자 포트번호 : <%=request.getRemotePort() %></h3>
	<h3>서버 정보 : <%=request.getServerName() %></h3>
	<h3>서버 포트번호 : <%=request.getServerPort() %></h3>
	<h3>프로토콜 방식 : <%=request.getProtocol() %></h3>
	<h3>전송 방식 : <%=request.getMethod() %></h3>
	<h3>프로젝트 이름 : <%= (request.getContextPath()).substring(1) %></h3>
	<h3>사용자 접속 페이지 : <%=request.getRequestURI() %></h3>
	<h3>프로젝트 경로 : <%= request.getContextPath() %></h3>
</body>
</html>