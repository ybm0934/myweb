<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="edto" class="yong.emp.EmpDTO" />
<jsp:setProperty property="*" name="edto" />
<jsp:useBean id="edao" class="yong.emp.EmpDAO" />
<%
	int result = edao.empDelete(edto);
	
	String msg = (result > 0) ? "사원을 삭제하였습니다." : "사원 삭제 실패(Bean)";
	
%>
	<script>
		alert('<%=msg %>');
		location.href = "empList2.jsp";
	</script>