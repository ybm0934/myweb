<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사칙 계산기</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/test/css/mainLayout.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/test/css/cal.css">
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		$("#num1").keyup(function(e){
			if(!(e.keyCode >= 48 && e.keyCode <= 57)){
				$("#num1").val(" ");
				$("#spn").html("숫자가 아닙니다.");
			}else {
				$("#spn").html("");
			}
		});
		
		$("#num2").keyup(function(e){
			if(!(e.keyCode >= 48 && e.keyCode <= 57)){
				$("#num2").val(" ");
				$("#spn").html("숫자가 아닙니다.");
			}else {
				$("#spn").html("");
			}
		});
		
		$("#btn1").click(function(e){
			var num1 = $("#num1").val();
			var num2 = $("#num2").val();
			
			if(num1 == null || num1.length == 0){
				alert("첫번째 수를 입력하세요.");
				$("#num1").focus();
				e.preventDefault();
			}else if(num2 == null || num2.length == 0){
				alert("두번째 수를 입력하세요.");
				$("#num2").focus();
				e.preventDefault();
			}else {
				$("#fm").submit();
			}
		});
	});
</script>
<body>
<%@ include file="header.jsp" %>
<form name="fm" id="fm" method="post" action="cal_ok.jsp">
    <div id="cal-div">
        <h1>사칙 계산기</h1>
        <div id="cal-div-1">
            <input type="text" name="num1" id="num1" class="txtbox" placeholder="첫 번째 숫자를 입력하세요." autofocus="autofocus">
            <select id="sel" name="oper">
                <option value="+">+</option>
                <option value="-">-</option>
                <option value="*">*</option>
                <option value="/">/</option>
            </select>
            <input type="text" name="num2" id="num2" class="txtbox" placeholder="두 번째 숫자를 입력하세요.">
        </div>
        <div id="div-spn">
            <span id="spn" style="color:red;"></span>
        </div>
        <div id="cal-div-2">
            <input type="button" value="계산" class="btn" id="btn1">
            <input type="reset" value="취소" class="btn">
        </div>
    </div>
</form>
<%@include file="footer.jsp" %>
</body>
</html>