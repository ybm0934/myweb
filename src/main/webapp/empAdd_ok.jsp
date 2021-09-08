<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String dept = request.getParameter("dept");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "YBM";
	String pwd = "1234";
	
	Connection con = DriverManager.getConnection(url, user, pwd);
	
	String sql = "insert into employee values(employee_seq.nextval, ?, ?, ?, sysdate)";
	
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, name);
	ps.setString(2, email);
	ps.setString(3, dept);
	
	int cnt = ps.executeUpdate();

	ps.close();
	con.close();
	
	if(cnt > 0){
		%>
		<script>
			location.href = 'empList.jsp';
		</script>
		<%
	}else {
		%>
		<script>
			alert("사원 등록에 실패하였습니다.");
			location.href = 'empList.jsp';
		</script>
		<%
	}
%>