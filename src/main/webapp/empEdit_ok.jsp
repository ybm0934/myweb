<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
	request.setCharacterEncoding("UTF-8");

	String empno = request.getParameter("empno");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String dept = request.getParameter("dept");

	Connection con = null;
	PreparedStatement ps = null;
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "YBM";
		String pwd = "1234";
		
		con = DriverManager.getConnection(url, user, pwd);
		
		String sql  = "update employee set name = ?, email = ?, dept = ? where empno = ?";
		
		ps = con.prepareStatement(sql);
		ps.setString(1, name);
		ps.setString(2, email);
		ps.setString(3, dept);
		ps.setInt(4, Integer.parseInt(empno));
		int cnt = ps.executeUpdate();
		
		if(cnt > 0){
			%>
			<script>
				alert("정보 수정 성공");
				location.href = "empList.jsp";
			</script>
			<%
		}else {
			%>
			<script>
				alert("정보 수정 실패!");
				location.href = "empList.jsp";
			</script>
			<%
		}
	}catch(ClassNotFoundException e){
		e.printStackTrace();
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		try{
			if(ps != null) ps.close();
			if(con != null) con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	

%>