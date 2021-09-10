<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.net.*"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	InetAddress inet = InetAddress.getLocalHost();
	String ip = inet.getHostAddress();
	ip = URLEncoder.encode(ip);
	Calendar now = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
	String date = sdf.format(now.getTime());
	date = URLEncoder.encode(date);
	
	/* Cookie[] cks = request.getCookies();
	
	String key = "";
	String value = "";
	if(cks != null){
		for(int i = 0; i < cks.length; i++){
			key = URLDecoder.decode(cks[i].getName());
			value = URLDecoder.decode(cks[i].getValue());
		}
	} */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		$('#day-close').change(function(){
			var chk = $(this).is(':checked');
			
			if(chk == true){
				<%
				
				Cookie ck = new Cookie(ip, date);
				ck.setMaxAge(10);
				
				response.addCookie(ck);
				
				%>
				
				self.close();
			}else {
				alert('체크박스 체크 해제됨');
			}
		});
	});
</script>
<style>
	.top {height:400px;}
	.center {}
	.bottom {text-align: right;}
</style>
</head>
<body>
	<div class="top">
	</div>
	<div class="center">
	</div>
	<div class="bottom">
		<label for="day-close">
			<input type="checkbox" name="day-close" id="day-close">
			<span>오늘 하루 동안 창 열지 않기</span>
		</label>
	</div>
</body>
</html>