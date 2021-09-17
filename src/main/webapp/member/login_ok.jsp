<%@page import="yong.member.MemberDTO"%>
<%@page import="yong.member.MemberDAO"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="yong.member.MemberDAO" scope="session" />
<%
	System.out.println("\r\nlogin_ok.jsp 실행");

	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String remember_id = request.getParameter("remember_id");
	System.out.println("id : " + id);
	System.out.println("pwd : " + pwd);
	System.out.println("remember_id : " + remember_id);
	
	// DAO 로그인 처리
	int cnt = dao.loginCheck(id, pwd);

	if(cnt == MemberDAO.LOGIN_OK){
		MemberDTO dto = new MemberDTO();
		dto = dao.selectMember(id);
		
		session.setAttribute("userid", id);
		session.setAttribute("userName", dto.getName());
		session.setMaxInactiveInterval(60 * 30);
		
		// 아이디 저장하기 처리
		Cookie ck = new Cookie("remember_id", URLEncoder.encode(id));
		if(remember_id.equals("true")) {
			ck.setMaxAge(60 * 60 * 24 * 30);
			ck.setPath("/");
			response.addCookie(ck);
		}else {
			ck.setMaxAge(0);
			ck.setPath("/");
			response.addCookie(ck);
		}
%>
	<script>
		opener.document.location.reload();
		window.close();
	</script>
<%
	}else if(cnt == MemberDAO.ID_NONE){
%>
	<span>아이디가 존재하지 않습니다.</span>
<%
	}else if(cnt == MemberDAO.PWD_DISCORD){
%>
	<span>비밀번호가 잘못 되었습니다.</span>
<%
	}else {
%>
	<script>
		alert('로그인 실패!');
		window.close();
	</script>
<%
	}
%>

