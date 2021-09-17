<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ip = request.getParameter("ip");
	String check = request.getParameter("day-close");
	
	// 오늘 하루 안 보기
	long today = 1000 * 60 * 60 * 24; // 하루 초
	long curTime = System.currentTimeMillis(); // 현재 초
	long result = today - curTime;
	
	if(check != null) {
		Cookie ck = new Cookie("check24", ip);
		ck.setMaxAge((int) result);
		response.addCookie(ck);
	}
%>

<script>
	window.close();
</script>