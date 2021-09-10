<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="yong.emp.EmpDAO" %>
<%@ page import="yong.emp.EmpDTO" %>
<%@ page import="java.util.*" %>
<%
	String method = request.getMethod();

	String name = request.getParameter("name");

	EmpDAO dao = new EmpDAO();
	EmpDTO dto = new EmpDTO();
	List<EmpDTO> list = new ArrayList<EmpDTO>();
	list = dao.empList("name", name);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#tb {
		border-collapse: collapse;
		width:1000px;
	}
	
	#tb tr th {
		border-top: 1px solid gray;
		border-bottom: 1px solid gray;
	}
	
	#tb tr td {
		border-top: 1px solid gray;
		border-bottom: 1px solid gray;
		text-align: center;
	}
</style>
</head>
<body>
<section>
   <article>
		<table id="tb">
		   <tr>
		      <th>EMPNO</th>
		      <th>NAME</th>
		      <th>EMAIL</th>
		      <th>DEPT</th>
		   </tr>
		   <%
		   	for(int i = 0; i < list.size(); i++) {
		   %>
		   <tr>
			<td><%=list.get(i).getEmpno() %></td>
			<td><%=list.get(i).getName() %></td>
			<td><%=list.get(i).getEmail() %></td>
			<td><%=list.get(i).getDept() %></td>
		   </tr>
		   <%} %>
		</table>
   </article>
</section>
</body>
</html>