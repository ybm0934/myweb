<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="wf" class="yong.wf.WebFolderDAO" scope="session" />
<%
	request.setCharacterEncoding("UTF-8");

	String cp = request.getParameter("cp");
	String fName = request.getParameter("fName");
	System.out.println("fileDelete_ok.jsp 실행");
	System.out.println("cp : " + cp);
	System.out.println("fName : " + fName);
	
	wf.setCrpath(cp);
	boolean access = wf.userFolderDel(fName);
	
	if(access == true) {
		%>
		<script>
			alert('삭제 되었습니다.');
			location.href = '<%=request.getContextPath() %>/webFolder/webFolder.jsp';
		</script>
		<%
	}else {
		%>
		<script>
			alert('삭제 실패!');
			location.href = '<%=request.getContextPath() %>/webFolder/webFolder.jsp';
		</script>
		<%
	}
%>