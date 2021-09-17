<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dto" class="yong.member.MemberDTO" />
<jsp:setProperty property="*" name="dto" />
<jsp:useBean id="memService" class="yong.member.MemberService" />
<%
	String msg = "", url = request.getContextPath();

	int n = memService.insertMember(dto);
	
	if(n > 0) {
		msg = "회원 가입 성공";
		url +=  "/index.jsp";
	}else {
		msg = "회원 가입 실패";
		url += "/member/register.jsp";
	}
	
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
%>
<jsp:forward page="../common/message.jsp" />