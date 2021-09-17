<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="wf" class="yong.wf.WebFolderDAO" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/test/css/mainLayout.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/webFolder/css/webFolder.css">
</head>
<body>
<%@include file="/header.jsp" %>
<%
	if(userid == null || userid.equals("")){
		%>
		<script>
			alert('로그인 후 이용가능한 서비스입니다.');
			location.href = '/myweb';
		</script>
		<%
	}
%>
<%
	wf.setUserid(userid);
	wf.userFolderExist();
	
	String cp = request.getParameter("cp");
	if(cp == null || cp.equals("")) {
		cp = userid;
	}
	wf.setCrpath(cp);
%>
<section id="f_sec">
	<article>
		<h2><%=userName %>님의 Y드라이브</h2>
		<fieldset>
			<legend>용량 정보</legend>
			<ul>
				<li><label>총 용량</label><meter min="0" max="<%=wf.getTotalSize() %>" value="<%=wf.getTotalSize()%>"></meter>(<%=wf.getTotalSize()%> byte)</li>
				<li><label>사용 용량</label><meter min="0" max="<%=wf.getTotalSize() %>" value="<%=wf.getUsedSize()%>"></meter>(<%=wf.getUsedSize()%> byte)</li>
				<li><label>남은 용량</label><meter min="0" max="<%=wf.getTotalSize() %>" value="<%=wf.getFreeSize()%>"></meter>(<%=wf.getFreeSize()%> byte)</li>
			</ul>
		</fieldset>
	</article>
	<article>
		<fieldset>
			<input type="button" value="파일 올리기" onclick="openFileUpload();">
			<input type="button" value="폴더 만들기" onclick="openFolderMake();">
		</fieldset>
		<fieldset>
			<legend>탐색기</legend>
			<form name="down" method="post" action="<%=request.getContextPath() %>/webFolder/download.jsp">
				<table>
					<thead>
						<tr>
							<th>분류</th>
							<th>파일 및 폴더명</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tfoot></tfoot>
					<tbody>
					<%
					if(!wf.getCrpath().equals(wf.getUserid())) {
						int point = wf.getCrpath().lastIndexOf("/");
						String upcp = wf.getCrpath().substring(0, point);
					%>
						<tr>
							<td colspan="3" align="left">
								<a href="/myweb/webFolder/webFolder.jsp?cp=<%=upcp %>">상위로...</a>
							</td>
						</tr>
					<%} %>
					<%
					File f = new File(wf.USERS_HOME + "\\" + wf.getCrpath());
					
					File[] files = f.listFiles();
					
					if(files == null || files.length == 0){
						%>
						<tr>
							<td colspan="3" align="center">
							등록된 파일이 없습니다.
							</td>
						</tr>
						<%
					}else {
						for(int i = 0; i < files.length; i++) {
							%>
							<tr>
								<th><%=files[i].isDirectory() ? "[폴더]" : "[파일]" %></th>
								<td>
								<%
								if(files[i].isFile()) {
								%>
									<a href="/myweb/webFolder/upload/<%=wf.getCrpath() %>/<%=files[i].getName() %>"><%=files[i].getName() %></a>
								<%
								}else {
								%>
									<a href="/myweb/webFolder/webFolder.jsp?cp=<%=wf.getCrpath() %>/<%=files[i].getName() %>"><%=files[i].getName() %></a>
								<%
								}
								%>
								</td>
								<td>
									<input type="button" name="del" class="btn" value="삭제" onclick="deleteFolder('<%=files[i].getName() %>')">
								</td>
								<td></td>
							</tr>
							<%
						}
					}
					%>
					</tbody>
				</table>
			</form>
		</fieldset>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
<script type="text/javascript">
	function openFileUpload() {
		window.open('<%=request.getContextPath()%>/webFolder/fileUpload.jsp', 'fileUpload', 'width=350, height=250');
	}
	
	function openFolderMake() {
		window.open('<%=request.getContextPath()%>/webFolder/folderUpload.jsp?cp=<%=wf.getCrpath() %>', 'folderUpload', 'width=350, height=250');
	}
	
	function deleteFolder(fName) {
		var str = '하위 폴더까지 전부 삭제됩니다. 삭제하시겠습니까?';
		if(confirm(str)){
			location.href = '<%=request.getContextPath()%>/webFolder/fileDelete_ok.jsp?fName=' + fName + '&cp=<%=wf.getCrpath() %>';
		}else {
			return false;
		}
	}
</script>
</html>
