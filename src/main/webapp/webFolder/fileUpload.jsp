<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="fileUpload" action="<%=request.getContextPath() %>/webFolder/fileUpload_ok.jsp" method="post" enctype="multipart/form-data">
	<fieldset>
		<legend>파일올리기</legend>
		<input type="file" name="upload" required="required">
		<input type="submit" value="파일올리기">
	</fieldset>
</form>
</body>
</html>