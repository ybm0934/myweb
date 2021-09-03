<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폼 테스트</title>
<link rel="stylesheet" type="text/css" href="test/css/mainLayout.css">
</head>
<body>
	<%@ include file="header.jsp"%>
	<div>
		<div>
			<h2>넘어온 파라미터 확인</h2>
			<%
				String name = request.getParameter("name");
				String pwd = request.getParameter("pwd");
				String gender = request.getParameter("gender");
				String[] hobby = request.getParameterValues("hobby");
				
				if(gender == null){
					gender = "선택 안함";
				}
				
				String hobbies = "";
				if (hobby == null || hobby.length == 0) {
					hobbies = "취미 선택 안함";
				}else {
					for (int i = 0; i < hobby.length; i++) {
						hobbies += hobby[i] + " ";
					}
				}
			%>	
			<h3>이름 : <%=name %></h3>
			<h3>비밀번호 : <%=pwd %></h3>
			<h3>성별 : <%=gender %></h3>
			<h3>취미 : <%=hobbies %></h3>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>