<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/test/css/mainLayout.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/test/css/empAdd.css">
</head>
<body>
<%@ include file="../header.jsp" %>
	<div id="article">
        <div id="section">
		<h2 style="text-align: center;">사원 관리 프로그램(Beans 방식)</h2>
		<form name="empAdd2" method="post" action="<%=request.getContextPath() %>/emp2/empAdd2_ok.jsp">
			<fieldset>
				<legend>사원 등록</legend>
				<table id="tb1">
					<tr>
                        <th>사원이름</th>
                        <td>
                            <input type="text" name="name" id="name" class="box" autofocus="autofocus">
                        </td>
                    </tr>
                    <tr>
                        <th>E-mail</th>
                        <td>
                            <input type="text" name="email" id="email" class="box">
                        </td>
                    </tr>
                    <tr>
                        <th>부서명</th>
                        <td>
                            <input type="text" name="dept" id="dept" class="box">
                        </td>
                    </tr>
					<tr>
						<th colspan="2">
							<input type="submit" value="사원등록" class="btn btn1" id="add">
							<input type="reset" value="다시작성" class="btn btn2">
						</th>
					</tr>
				</table>
			</fieldset>
		</form>
		</div>
	</div>
<%@ include file="../footer.jsp" %>
</body>
</html>