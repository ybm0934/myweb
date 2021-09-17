<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="wf" class="yong.wf.WebFolderDAO" scope="session" />
<%
	request.setCharacterEncoding("UTF-8");
	
	String cp = request.getParameter("cp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function makeFolder(){
		var fName = document.getElementById('fName').value;
		
		if(fName.length == 0){
			alert('폴더명을 입력하세요!');
			return false;
		}else {
			document.fm.submit();
		}
	}
</script>
</head>
<body>
<form name="fm" method="post" action="<%=request.getContextPath()%>/webFolder/folderUpload_ok.jsp">
<input type="hidden" name="cp" value="<%=cp %>">
	<fieldset>
		<legend>폴더 만들기</legend>
		<input type="text" id="fName" name="fName" placeholder="폴더명을 입력하세요." autofocus="autofocus">
		<input type="button" value="폴더 생성" onclick="makeFolder();">
	</fieldset>
</form>
</body>
</html>