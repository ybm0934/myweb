<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cks = request.getCookies();

	String name = "";
	String value = "";
	String check = "";
	
	if(cks != null) {
		for(int i = 0; i < cks.length; i++) {
			name = cks[i].getName();
			value = cks[i].getValue();
			
			if(name.equals("remember_id")) {
				check = "on";
				break;
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN Page</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/member/css/login.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		$('#login_btn').click(function(){
			$.ajax({
				url : '<%=request.getContextPath() %>/member/login_ok.jsp',
				type : 'POST',
				data : {
					id : $('#id').val(),
					pwd : $('#pwd').val(),
					remember_id : $('#remember_id').is(':checked')
				},
				datatype : 'JSON',
				success : function(data){
					$('#error').html(data);
				},
				error : function(){
					alert('통신 실패');
				}
			});
		}); // ajax
	});
</script>
</head>
<body>
    <form name="login" id="login" method="post" action="<%=request.getContextPath() %>/member/login_ok.jsp">
        <div id="header">
            <h1>LOGIN</h1>
        </div>
		<table id="login_tb">
		<caption>로그인 테이블</caption>
			<tr>
                <th>아이디</th>
                <td>
                    <input type="text" name="id" id="id" class="textbox" value="<%if(name.equals("remember_id")) %><%=value %>" placeholder="아이디를 입력하세요.">
                </td>
            </tr>
			<tr>
                <th>패스워드</th>
                <td>
                    <input type="password" name="pwd" id="pwd" class="textbox" placeholder="패스워드를 입력하세요.">
                </td>
            </tr>
            <tr>
            	<th colspan="2" id="error"></th>
            </tr>
            <tr>
                <td colspan="2">
                    <label for="remember_id">
                        <input type="checkbox" name="remember_id" id="remember_id"
                        <% if(check.equals("on")) { %>
                        	checked="checked"
                        <% } %>
                        > 
                        <span>아이디 저장하기</span>
                    </label>
                </td>
            </tr>
            <tr>
                <th colspan="2">
                    <input type="button" id="login_btn" class="btn" value="Login">
                </th>
            </tr>
		</table>
	</form>
</body>
</html>