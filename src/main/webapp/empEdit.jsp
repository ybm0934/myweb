<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String empno = request.getParameter("empno");

	Class.forName("oracle.jdbc.driver.OracleDriver");

	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "YBM";
	String pwd = "1234";
	
	Connection con = DriverManager.getConnection(url, user, pwd);
	
	String sql = "select * from employee where empno = ?";
	
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setInt(1, Integer.parseInt(empno));
	
	ResultSet rs = ps.executeQuery();
	
	String no = "";
	String name = "";
	String email = "";
	String dept = "";
	
	if(rs.next()){
		empno = rs.getString("empno");
		name = rs.getString("name");
		email = rs.getString("email");
		dept = rs.getString("dept");
	}
	
	rs.close();
	ps.close();
	con.close();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>사원 관리 프로그램(원시형)</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/test/css/mainLayout.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/test/css/empAdd.css">
<script>
	function edit_btn(){
		var name = document.getElementById('name').value;
		var email = document.getElementById('email').value;
		var dept = document.getElementById('dept').value;
		
		if(name == ""){
			alert('이름을 입력하세요.');
			document.getElementById('name').focus();
		}else if(email == ""){
			alert('이메일을 입력하세요.');
			document.getElementById('email').focus();
		}else if(dept == ""){
			alert('부서명을 입력하세요.');
			document.getElementById('dept').focus();
		}else {
			document.empEdit.submit();
		}
	}

	function reset_btn(){
		document.getElementById('name').value = "";
		document.getElementById('email').value = "";
		document.getElementById('dept').value = "";
	}
	
	function back_btn(){
		location.href = 'empList.jsp';
	}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
    <div id="article">
        <div id="section">
            <%@ include file="empHome.jsp" %>
            <form name="empEdit" id="empEdit" method="post" action="empEdit_ok.jsp">
                <fieldset>
                    <legend>사원수정</legend>
                    <input type="hidden" name="empno" value="<%=empno %>" readonly="readonly">
                    <table id="tb1">
                        <tr>
                            <th>사원이름</th>
                            <td>
                                <input type="text" name="name" id="name" class="box" value="<%=name %>">
                            </td>
                        </tr>
                        <tr>
                            <th>E-mail</th>
                            <td>
                                <input type="text" name="email" id="email" class="box" value="<%=email %>">
                            </td>
                        </tr>
                        <tr>
                            <th>부서명</th>
                            <td>
                                <input type="text" name="dept" id="dept" class="box" value="<%=dept %>">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <input type="button" value="수정완료" class="btn btn1" onclick="edit_btn();">
                                <input type="button" value="리셋" class="btn btn2" onclick="reset_btn();">
                                <input type="button" value="돌아가기" class="btn btn2" onclick="back_btn();">
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </form>
        </div>
    </div>
<%@ include file="footer.jsp" %>
</body>
</html>