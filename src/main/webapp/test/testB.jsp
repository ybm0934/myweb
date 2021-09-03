<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 두번째 JSP</title>
</head>
<body>
	<h1>내가 만든 두번째 JSP</h1>
	<!-- 이것은 주석입니다. -->
	<%
	/* 여기는 자바 코드가 들어갈 부분입니다. */
	System.out.println("이것은 JSP에서 작성한 문장");
	out.println("<h3>이것은 JSP에서 작성한 문장</h3>");

	String str = "Java"; // 지역변수

	out.println("<h3>str의 값 : " + str + "</h3>");
	%>

	<h3>
		str의 값 :
		<%=str%></h3>

	<%!String str = "jsp";

	public int getSumNum(int num1, int num2) {
		int result = num1 + num2;

		return result;
	}%>

	<%
	out.println("<h3>3 + 5 = " + getSumNum(3, 5) + "</h3>");
	%>

	<h3>
		5 + 6 =
		<%=getSumNum(5, 6)%></h3>
	<h3>
		str =
		<%=str%></h3>
	<!-- 전역변수 출력 -->
	<h3>
		str =
		<%=this.str%></h3>
	<!-- 지역변수 출력 -->

	<%
	Calendar now = Calendar.getInstance();

	int y = now.get(Calendar.YEAR);
	int m = now.get(Calendar.MONTH) + 1;
	int d = now.get(Calendar.DATE);

	out.println("<h1>" + y + "년 " + m + "월 " + d + "일</h1>");
	%>
</body>
</html>














