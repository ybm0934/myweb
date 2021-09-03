<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	String empno = request.getParameter("empno");
	String name_ok = request.getParameter("name_ok");

	Class.forName("oracle.jdbc.driver.OracleDriver");

	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "YBM";
	String pwd = "1234";
	
	Connection con = DriverManager.getConnection(url, user, pwd);
	
	String sql = "delete from employee where empno = ? and name = ?";
	
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, empno);
	ps.setString(2, name_ok);
	
	int cnt = ps.executeUpdate();
	
	if(cnt > 0){
		%>
		<script>
			alert('삭제되었습니다.');
			location.href = 'empList.jsp';
		</script>
		<%
	}else {
		%>
		<script>
			alert('삭제 실패!');
			location.href = 'empList.jsp';
		</script>
		<%
	}
	
	ps.close();
	con.close();
%>