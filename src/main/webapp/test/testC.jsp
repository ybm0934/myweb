<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP를 이용한 구구단 출력</title>
</head>
<body>
	<div id="wrap">
		<h1>구구단 출력</h1>
		<%
		for (int i = 2; i <= 9; i++) {
			out.println("<div style='border:1px solid gray; float:left; padding:30px; margin-bottom:50px;'>");
			for (int j = 1; j <= 9; j++) {
				out.println("<h5>" + i + " * " + j + " = " + (i * j) + "</h5>");
			}
			out.println("</div>");
		}
		%>
	</div>
	<div style="clear: both; margin-top: 50px;">
		<table border="1">
			<%
			for (int i = 2; i <= 9; i++) {
			%>
			<tr>
				<%
				for (int j = 2; j <= 9; j++) {
				%>
				<td><%=j%> * <%=i%> = <%=j * i%></td>
				<%
				}
				%>
			</tr>
			<%
			}
			%>
		</table>
	</div>
</body>
</html>