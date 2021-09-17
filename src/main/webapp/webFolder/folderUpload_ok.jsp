<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="wf" class="yong.wf.WebFolderDAO" scope="session" />
<%
	request.setCharacterEncoding("UTF-8");

	String cp = request.getParameter("cp");
	String fName = request.getParameter("fName");
	
	System.out.println("folderUpload_ok.jsp 실행");
	System.out.println("cp 값 : " + cp);
	System.out.println("fName 값 : " + fName);
	
	wf.setCrpath(cp);
	boolean flag = wf.userFolderMk(fName);
	System.out.println("boolean flag 값 : " + flag);
	
	if(flag == true) {
		%>
		<script>
			opener.location.reload();
			window.close();
		</script>
		<%
	}else {
		%>
		<script>
			alert('폴더 이름이 중복 되었습니다.');
			history.back();
		</script>
		<%
	}
	
%>