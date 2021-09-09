<%@page import="java.net.InetAddress"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ip = request.getRemoteAddr();
	String ip2 = request.getRemoteHost();
	InetAddress inetIp = InetAddress.getLocalHost();
	String ip3 = inetIp.getHostAddress();
	String port = Integer.toString(request.getRemotePort());
	
	System.out.println("Client ip Address : " + ip);
	System.out.println("Client ip2 Address : " + ip2);
	System.out.println("Client ip3 Address : " + ip3);
	System.out.println("Client Port Number : " + port);
	System.out.println();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/test/css/mainLayout.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/member/css/register.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		// 페이지 이동 감지 경고창
		window.onbeforeunload = function() {
			return false;
		};
		
		// 중복확인 새창 가운데 띄우기
		$('#duplbtn').click(function(){
			var _width = 500;
			var _height = 500;
			var _left = (window.screen.width / 2) - (_width / 2);
			var _top = (window.screen.height / 2) - (_height / 2);
			
			window.open('<%=request.getContextPath() %>/member/idCheck.jsp', '아이디 중복 확인', 'width = ' + _width + ', height = ' + _height + ', top = ' + _top + ', left = ' + _left);
		});
		
		// 주소검색 새창 가운데 띄우기
		$('#addr_search_btn').click(function(){
			var _width = 600;
			var _height = 800;
			var _left = (window.screen.width / 2) - (_width / 2);
			var _top = (window.screen.height / 2) - (_height / 2);
			
			window.open('<%=request.getContextPath() %>/member/searchAddress.jsp', '주소 검색', 'width = ' + _width + ', height = ' + _height + ', top = ' + _top + ', left = ' + _left);
		});
		
		// 정규 표현식
		var reg_exp = /[^a-z0-9A-Z]/gi; // 영문 & 숫자만
		
		// 값이 있을 경우 error 메세지 초기화
		$(document).mousemove(function(){
			if($('#id').val().length > 0) {
				$('#id_error').html('');
			}
		});
		
		$('#password').focusout(function(){
			if($(this).val().length > 0) {
				$('#password_error').html('');
			}
		});
		
		$('#birth_year').focusout(function(){
			if($(this).val().length > 0) {
				$('#birth_error').html('');
			}
		});
		
		$('#birth_monday').change(function(){
			if($(this).val().length > 0) {
				$('#birth_error').html('');
			}
		});
		
		$('#birth_day').focusout(function(){
			if($(this).val().length > 0) {
				$('#birth_error').html('');
			}
		});
		
		$('#gender').change(function(){
			if($(this).val().length > 0) {
				$('#gender_error').html('');
			}
		});
		
		$('#email').focusout(function(){
			if($(this).val().length > 0) {
				$('#email_error').html('');
			}
		});
		
		$('#tel2').focusout(function(){
			if($(this).val().length > 0) {
				$('#tel_error').html('');
			}
		});
		
		$(document).mousemove(function(){
			if($('#zipcode').val().length > 0) {
				$('#address_error').html('');
			}
		});
		
		// 생년 예외처리
		$('#birth_year').focusout(function(){
			if(isNaN($(this).val())){
				$('#birth_error').html('숫자만 입력 가능합니다.');
				$(this).val('');
				$(this).focus();
			}else {
				$('#birth_error').html('');
			}
		});
		
		// 생일 예외처리
		$('#birth_day').focusout(function(){
			if(isNaN($(this).val())){
				$('#birth_error').html('숫자만 입력 가능합니다.');
				$(this).val('');
				$(this).focus();
			}else {
				$('#birth_error').html('');
			}
		});
		
		// submit 전 유효성 검사
		$('#regbtn').click(function(){
			// 생일 합치기
			var year = $('#birth_year').val();
			var monday = $('#birth_monday').val();
			var day = $('#birth_day').val();
			var birthday = year + '-' + monday + '-' + day;
			$('#birthday').val(birthday);
			
			if($('#id').val() == ''){
				$('#id').focus();
				$('#id_error').html('아이디를 입력하세요.');
				
				return false;
			}else if($('#password').val() == '') {
				$('#password').focus();
				$('#password_error').html('비밀번호를 입력하세요.');
				
				return false;
			}else if($('#password_ok').val() == ''){
				$('#password_ok').focus();
				$('#password_ok_error').html('비밀번호 확인을 입력하세요.');
				
				return false;
			}else if($('#name').val() == ''){
				$('#name').focus();
				$('#name_error').html('이름을 입력하세요.');
				
				return false;
			}else if(year == '') {
				$('#birth_year').focus();
				$('#birth_error').html('년을 입력하세요.');
				
				return false;
			}else if(monday == '') {
				$('#birth_monday').focus();
				$('#birth_error').html('월을 입력하세요.');
				
				return false;
			}else if(day == '') {
				$('#birth_day').focus();
				$('#birth_error').html('일을 입력하세요.');
				
				return false;
			}else if($('#gender').val() == '') {
				$('#gender').focus();
				$('#gender_error').html('성별을 입력하세요.');
				
				return false;
			}else if($('#email').val() == '') {
				$('#email').focus();
				$('#email_error').html('이메일을 입력하세요.');
				
				return false;
			}else if($('#tel2').val() == ''){
				$('#tel2').focus();
				$('#tel_error').html('전화번호를 입력하세요.');
				
				return false;
			}else if($('#zipcode').val() == ''){
				$('#zipcode').focus();
				$('#address_error').html('주소를 입력하세요.');
				
				return false;
			}
			
			// document.register.submit();
		});
	});
</script>
</head>
<!--
	oncontextmenu='return false': 우클릭 방지
	onselectstart='return false': 블록선택 방지
	ondragstart='return false': 드래그 방지
-->
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
<%@ include file="/header.jsp" %>
	<div id="register_div">
        <form name="register" method="post" action="<%=request.getContextPath() %>/member/register_ok.jsp">
        <div id="logo_div">
            <img src="img/register_logo.png" alt="회원가입 로고">
        </div>
        <div id="id_div">
            <h3>아이디</h3>
            <div class="box">
                <input type="text" id="id" name="id" class="textbox" placeholder="중복검사를 누르세요." readonly>
                <input type="button" id="duplbtn" class="btn" value="중복검사">
            </div>
            <span id="id_error" class="error"></span>
        </div>
        <div id="password_div">
            <h3>비밀번호</h3>
            <div class="box">
                <input type="password" name="password" id="password" class="textbox" maxlength="15" placeholder="비밀번호 입력">
            </div>
            <span id="password_error" class="error"></span>
        </div>
        <div id="password_ok_div">
            <h3>비밀번호 확인</h3>
            <div class="box">
                <input type="password" name="password_ok" id="password_ok" class="textbox" maxlength="15" placeholder="비밀번호 입력">
            </div>
            <span id="password_ok_error" class="error"></span>
        </div>
        <div id="name_div">
            <h3>이름</h3>
            <div class="box">
                <input type="text" name="name" id="name" class="textbox" maxlength="7" placeholder="이름 입력">
            </div>
            <span id="name_error" class="error"></span>
        </div>
        <div id="birthday_div">
            <h3>생년월일</h3>
            <span class="birth_box">
                <input type="text" id="birth_year" class="birth_textbox" placeholder="년(4자)" maxlength="4">
            </span>
            <span class="birth_box">
                <select id="birth_monday">
                    <option value="">월</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                </select>
            </span>
            <span class="birth_box">
                <input type="text" id="birth_day" class="birth_textbox" placeholder="일" maxlength="2">
            </span>
            <input type="hidden" name="birthday" id="birthday">
            <span id="birth_error" class="error"></span>
        </div>
        <div id="gender_div">
            <h3>성별</h3>
            <div>
                <select id="gender" name="gender">
                    <option value="">성별</option>
                    <option value="남자">남자</option>
                    <option value="여자">여자</option>
                </select>
            </div>
            <span id="gender_error" class="error"></span>
        </div>
        <div id="email_div">
            <h3>이메일</h3>
            <div class="box">
                <input type="text" name="email" id="email" class="textbox" placeholder="이메일 입력" maxlength="20">
            </div>
            <span id="email_error" class="error"></span>
        </div>
        <div id="tel_div">
            <h3>전화번호</h3>
            <span class="tel_box1">
                <select id="tel1" name="tel1">
                    <option value="010">010</option>
                    <option value="011">011</option>
                    <option value="012">012</option>
                    <option value="013">013</option>
                    <option value="014">014</option>
                    <option value="015">015</option>
                    <option value="016">016</option>
                    <option value="016">017</option>
                    <option value="016">018</option>
                    <option value="016">019</option>
                </select>
            </span>
            <span class="tel_box2">
                <input type="text" name="tel2" id="tel2" class="textbox" placeholder="전화번호 입력" maxlength="8">
            </span>
            <span id="tel_error" class="error"></span>
        </div>
        <div id="address_div">
            <h3>주소</h3>
            <div class="box">
                <input type="text" name="zipcode" id="zipcode" class="textbox" placeholder="주소찾기를 누르세요." readonly="readonly">
                <input type="button" id="addr_search_btn" class="btn" value="주소찾기">
            </div>
            <div class="box">
                <input type="text" name="address1" id="address1" class="textbox" readonly="readonly">
            </div>
            <div class="box">
                <input type="text" name="address2" id="address2" class="textbox" maxlength="50">
            </div>
            <span id="address_error" class="error"></span>
        </div>
        <div id="button_div">
            <input type="button" id="regbtn" class="btn" value="가입하기">
        </div>
    </form>
    </div>
<%@ include file="/footer.jsp" %>
</body>
</html>