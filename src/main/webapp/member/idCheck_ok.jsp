<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="yong.member.MemberDTO" %>
<%@ page import="yong.member.MemberDAO" %>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	MemberDAO dao = new MemberDAO();
	boolean flag = dao.idCheck(id);
%>
<span>
<% if(flag == false) { %>
	사용 가능한 아이디입니다.
<% }else { %>
	'<%=id %>' 이미 사용 중인 아이디입니다.
<% } %>
</span>
<input type="hidden" id="flag" value="<%=flag %>">