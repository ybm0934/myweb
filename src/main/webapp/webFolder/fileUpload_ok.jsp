<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<jsp:useBean id="wf" class="yong.wf.WebFolderDAO" scope="session" />
<%
	request.setCharacterEncoding("UTF-8");
	
	String savePath = wf.USERS_HOME + "\\" + wf.getCrpath();
	
	try {
		MultipartRequest multi = new MultipartRequest(request, savePath, (int) wf.getFreeSize(), "UTF-8");
	}catch(Exception e) {
		%>
		<script>
			alert('업로드 실패!');
			self.close();
		</script>
		<%
	}
%>
<script>
	alert('업로드 성공!');
	opener.location.href = '<%=request.getContextPath() %>/webFolder/webFolder.jsp?cp=<%=wf.getCrpath() %>';
	self.close();
</script>