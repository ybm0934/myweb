<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>사원 관리 프로그램(원시형)</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/test/css/mainLayout.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/test/css/empAdd.css">
<script src="<%=request.getContextPath() %>/lib/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		$('#add').click(function(){
			
			if($('#name').val() == ''){
				alert('이름을 입력하세요.');
				$('#name').focus();
			}else if($('#email').val() == ''){
				alert('이메일을 입력하세요.');
				$('#email').focus();
			}else if($('#dept').val() == ''){
				alert('부서명을 입력하세요.');
				$('#dept').focus();
			}else {
				$("#empAdd").submit();
			}
		});
	});
</script>
</head>
<body>
<%@ include file="header.jsp" %>
    <div id="article">
        <div id="section">
            <%@ include file="empHome.jsp" %>
            <form name="empAdd" id="empAdd" method="post" action="empAdd_ok.jsp">
                <fieldset>
                    <legend>사원등록</legend>
                    <table id="tb1">
                        <tr>
                            <th>사원이름</th>
                            <td>
                                <input type="text" name="name" id="name" class="box" autofocus="autofocus">
                            </td>
                        </tr>
                        <tr>
                            <th>E-mail</th>
                            <td>
                                <input type="text" name="email" id="email" class="box">
                            </td>
                        </tr>
                        <tr>
                            <th>부서명</th>
                            <td>
                                <input type="text" name="dept" id="dept" class="box">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <input type="button" value="사원등록" class="btn btn1" id="add">
                                <input type="reset" value="다시작성" class="btn btn2">
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </form>
        </div>
    </div>
<%@ include file="footer.jsp" %>
</body>
</html>