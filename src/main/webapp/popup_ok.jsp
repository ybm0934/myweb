<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ip = request.getParameter("ip");
	String check = request.getParameter("day-close");
	
	if(check != null) {
		Cookie ck = new Cookie("check24", ip);
		ck.setMaxAge(60 * 60 * 24);
		response.addCookie(ck);
	}
%>

<script>
	window.close();
</script>