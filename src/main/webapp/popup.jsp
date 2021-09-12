<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ip = request.getRemoteAddr();
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
			if($(this).is(':checked')){
				$('#popup').submit();
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
<form name="popup" id="popup" method="post" action="popup_ok.jsp">
	<div class="top">
	</div>
	<div class="center">
	</div>
	<div class="bottom">
	<input type="hidden" name="ip" id="ip" value="<%=ip %>">
		<label for="day-close">
			<input type="checkbox" name="day-close" id="day-close">
			<span>오늘 하루 동안 창 열지 않기</span>
		</label>
	</div>
</form>
</body>
</html>