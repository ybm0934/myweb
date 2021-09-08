<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "yong.emp.EmpDTO" %>
<jsp:useBean id="edto" class="yong.emp.EmpDTO" />
<jsp:setProperty property="*" name="edto" />
<jsp:useBean id="edao" class="yong.emp.EmpDAO" />
<%
	request.setCharacterEncoding("UTF-8");

	edto = edao.empDetail(edto.getEmpno());
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>사원 관리 프로그램(원시형)</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/test/css/mainLayout.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/test/css/empAdd.css">
<script>
	function delete_btn(e){
		var name = document.getElementById('name').value;
		var name_ok = document.getElementById('name_ok').value;
		
		if(!(name == name_ok)){
			alert('이름이 잘못 되었습니다.');
			document.getElementById('name_ok').value = "";
			document.getElementById('name_ok').focus();
		}else {
			document.empDelete.submit();
		}
	}

	function back_btn(){
		location.href = '<%=request.getContextPath() %>/emp2/empList2.jsp';
	}
</script>
</head>
<body>
<%@ include file="../header.jsp" %>
    <div id="article">
        <div id="section">
            <%@ include file="empHome.jsp" %>
            <form name="empDelete" method="post" action="empDelete2_ok.jsp">
                <fieldset>
                    <legend>사원삭제</legend>
                    <input type="hidden" name="empno" value="<%=edto.getEmpno() %>" readonly="readonly">
                    <table id="tb1">
                        <tr>
                            <th>사원이름</th>
                            <td>
                                <input type="text" name="name" id="name" class="box" value="<%=edto.getName() %>" readonly="readonly">
                            </td>
                        </tr>
                        <tr>
                            <th>E-mail</th>
                            <td>
                                <input type="text" name="email" id="email" class="box" value="<%=edto.getEmail() %>" readonly="readonly">
                            </td>
                        </tr>
                        <tr>
                            <th>부서명</th>
                            <td>
                                <input type="text" name="dept" id="dept" class="box" value="<%=edto.getDept() %>" readonly="readonly">
                            </td>
                        </tr>
                        <tr>
                            <th>입사날짜</th>
                            <td>
                                <input type="text" name="dept" id="regdate" class="box" value="<%=edto.getRegdate() %>" readonly="readonly">
                            </td>
                        </tr>
                        <tr>
                            <th>삭제확인</th>
                            <td>
                                <input type="text" name="name_ok" id="name_ok" class="box" placeholder="이름을 입력하세요.">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <input type="button" value="삭제하기" class="btn btn1" onclick="delete_btn();">
                                <input type="button" value="돌아가기" class="btn btn2" onclick="back_btn();">
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </form>
        </div>
    </div>
<%@ include file="../footer.jsp" %>
</body>
</html>