<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	// 현재 페이지
	int currentPage = 1;

	if(request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	// 총 게시물 수
	int totalRecord = 237;
	
	// 한 페이지에 보여질 게시물 수
	int pageSize = 10;
	
	// 총 페이지 수
	int totalPage = (int) Math.ceil((double) totalRecord / pageSize);
	
	// 블럭 사이즈
	int blockSize = 10;
	
	// 블럭 시작 페이지
	int firstPage = currentPage - ((currentPage - 1) % blockSize);
	
	// 블럭 끝 페이지
	int lastPage = firstPage + (blockSize - 1);
	
	// 페이지 시작 게시물 번호
	int curPos = (currentPage - 1) * pageSize;
	
	// 반복문 break용 게시물 번호
	int num = totalRecord - curPos;
%>
<body>
	<h1>pageTest.jsp</h1>
	<h2>총 게시물 수 : <%=totalRecord %></h2>
	<h3>보여줄 게시물 수 : <%=pageSize %></h3>
	<h3>보여줄 페이지 수 : <%=blockSize %></h3>
	<h3>현재 사용자 위치 : <%=currentPage %></h3>
	<hr>
	<%for(int i = 0; i < blockSize; i++){ %>
	<%	if(num < 1) break; %>
	<%	num--; %>
		<h4 style="color:red;"><%=curPos++ %></h4>
	<%} %>
	<hr>
	<%if(firstPage > 1){ %>
		<a href="pageTest.jsp?currentPage=<%=1%>">first</a>
		<a href="pageTest.jsp?currentPage=<%=firstPage - 1%>">prev</a>
	<%} %>
	<%
		for(int i = firstPage; i < lastPage; i++){
			if(i > totalPage) break;
			%>
			<a href="pageTest.jsp?currentPage=<%=i %>"><%=i %></a>
			<%
		}
	%>
	<%if(lastPage < totalPage){ %>
		<a href="pageTest.jsp?currentPage=<%=lastPage + 1%>">next</a>
		<a href="pageTest.jsp?currentPage=<%=totalPage%>">last</a>
	<%} %>
</body>
</html>