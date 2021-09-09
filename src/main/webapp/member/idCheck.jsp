<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 확인</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/member/css/idCheck.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		// 정규 표현식
		var reg_exp = /[^a-z0-9A-Z]/gi; // 영문 & 숫자만
		
		$("#idBox").keyup(function(e) {
			var input = $(this).val();
			
			// 영문 & 숫자 아닐 시 초기화
			if (!(e.keyCode >= 37 && e.keyCode <= 40)) {
				// 영문 & 숫자 아닐 시 에러
				if(reg_exp.test(input)) {
					$('#print').html('영문 및 숫자만 입력 가능합니다.');
					$(this).val('');
				}else {
					$(this).val(input.replace(reg_exp, ''));
				}
			}
			
			// 아이디 중복 검사 후 변경 금지
			$('#flag').val('true');
        });
		
		$('#check_btn').click(function(){
			var id = $('#idBox').val();
			
			if(reg_exp.test(id)) {
				$('#print').html('영문 및 숫자만 입력 가능합니다.');
				$('#idBox').val('');
				
				return;
			}else if(id.length < 1) {
				$('#print').html('아이디를 입력하세요.');
				$('#idBox').focus();
				
				return;
			}else if(id.length > 10){
				$('#print').html('아이디는 10글자까지 가능합니다.');
				$('#idBox').focus();
				
				return;
			}else {
				// 중복검사 Ajax 통신 구현
				$.ajax({
					url : '<%=request.getContextPath() %>/member/idCheck_ok.jsp',
					type : 'POST',
					data : {
						id : id
					},
					datatype : 'JSON',
					success : function(data){
							$('#print').html(data);
						},
					error : function(){
						alert('통신 실패');
					}
				});
			}
		});
		
		$('#ok_btn').click(function(){
			var id = $('#idBox').val();
			var flag = $('#flag').val();
			
			if(id.length < 1) {
				$('#print').html('아이디를 입력하세요.');
				$('#idBox').focus();
				
				return;
			}else if(id.length > 10){
				$('#print').html('아이디는 10글자까지 가능합니다.');
				$('#idBox').focus();
				
				return;
			}else if(typeof flag == 'undefined' || flag == 'true') {
				$('#print').html('아이디 중복 검사를 해주세요.');
				$('#idBox').focus();
				
				return;
			}else if(flag == 'false') {
				window.opener.document.getElementById('id').value = id;
				
				self.close();
			}
		});
	});
</script>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
    <div id="idCheck_div">
		<h1>아이디 중복 확인</h1>
        <div id="top">
            <input type="text" id="idBox" name="idBox" class="textbox" maxlength="13" spellcheck="false" autofocus="autofocus">
            
            <input type="button" id="check_btn" class="btn" value="중복확인">
        </div>
        <div id="print"></div>
        <div id="bottom">
            <input type="button" id="ok_btn" class="btn" value="확인">
            <input type="button" class="btn" value="취소" onclick="self.close();">
        </div>
    </div>
</body>
</html>