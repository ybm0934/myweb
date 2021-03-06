<%@page import="java.net.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ip = request.getRemoteAddr();

	Calendar cal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
	String date = "첫 방문이시군요!";
	
	Date now = new Date();

	Cookie[] cks = request.getCookies();
	String name = "";
	String value = "";
	String popcheck = "false";
	if(cks != null) {
		for(int i = 0; i < cks.length; i++){
			name = URLDecoder.decode(cks[i].getName());
			value = URLDecoder.decode(cks[i].getValue());
			if(name.equals("check24") && value.equals(ip)){
				popcheck = "true";
			}

			if(name.equals("visit") && value.equals(ip)) {
				value = URLDecoder.decode(cks[i].getValue());
				//date = sdf.format(cal.getTime());
			}
		}//for
	}//if
	
	
	
	
	/*
	String key = "";
	String value = "";
	if(cks != null) {
		for(int i = 0; i < cks.length; i++) {
			String key = URLDecoder.decode(cks[i].getName());
			if(key.equals(ip)) {
				str = URLDecoder.decode(cks[i].getValue());
			}
		}
	}
	
	
	*/
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/test/css/mainLayout.css">
<script>
	window.onload = function(){
		var popcheck = document.getElementById('popcheck').value;
		
		if(popcheck == 'false'){
			popup();
		}
	}
	
	setInterval(function() {
		var now = new Date();
		document.getElementById('toLocale').innerHTML = now.toLocaleString();
	}, 1000);
	
	function popup(){
		var width = '500';
		var height = '500';
		var wx = (window.screen.width / 2) - (width / 2);
		var wy = (window.screen.height / 2) - (height / 2);
		window.open('popup.jsp', '팝업창', 'width=' + width + ', height=' + height + ', left=' + wx + ', top=' + wy);
	}
</script>
</head>
<body>
<input type="hidden" id="popcheck" value="<%=popcheck %>">
<%@include file="header.jsp" %>
    <section id="mainSec">
        <article id="mainImg">
            <img src="<%=request.getContextPath() %>/test/img/main.jpg" alt="메인 대표 이미지">
        </article>
        <article id="minMenu">
            <h2>안녕하세요.</h2>
            <h3>현재 시각</h3>
            <h3 id="toLocale"><%=now.toLocaleString() %></h3>
            <ul>
                <li>아래에 기능들이 추가될 것임</li>
                <li><a href="formTest.jsp">폼 테스트</a></li>
                <li><a href="cal.jsp">사칙 계산기</a></li>
                <li><a href="empList.jsp">사원 관리 프로그램(원시형)</a></li>
                <li><a href="emp2/empList2.jsp">사원 관리 프로그램(Beans)</a></li>
            </ul>
        </article>
    </section>
<%@include file="footer.jsp" %>
</body>
</html>
<%
	Cookie ck = new Cookie("visit", ip);
	ck.setMaxAge(60 * 60 * 24 * 30);
	
	response.addCookie(ck);
	
%>