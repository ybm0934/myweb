<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@page import="yong.emp.EmpDTO"%>
<jsp:useBean id="edto" class="yong.emp.EmpDTO" />
<jsp:setProperty property="empno" name="edto"/>
<jsp:setProperty property="name" name="edto"/>
<jsp:setProperty property="email" name="edto"/>
<jsp:setProperty property="dept" name="edto"/>
<jsp:useBean id="edao" class="yong.emp.EmpDAO" />
<%
	int cnt = edao.empEdit(edto);
	
	String msg = (cnt > 0) ? "사원 정보를 수정하였습니다." : "사원 정보 수정 실패(Beans)";
%>
	<script>
		alert('<%=msg %>');
		location.href = '<%=request.getContextPath() %>/emp2/empList2.jsp';
	</script>