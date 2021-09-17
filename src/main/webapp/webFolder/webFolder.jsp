<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/test/css/mainLayout.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/webFolder/css/webFolder.css">
<script type="text/javascript">
	function goDir(name){
		location.href = '<%=request.getContextPath() %>/webFolder/webFolder.jsp?path=' + name;
	}
	
	function goDownload(name) {
		location.href = '<%=request.getContextPath() %>/webFolder/download.jsp?name=' + name;
	}
	
</script>
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
<jsp:useBean id="wf" class="yong.wf.WebFolderDAO" scope="session" />
<%
	String path = request.getParameter("path");

	wf.setUserid(userid);
	wf.userFolderExist();
	
	Map<Integer, String> map = wf.seeker(path);
	System.out.println("map : " + map.size());
	Iterator<Integer> iter = map.keySet().iterator();
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
			<input type="button" value="파일 올리기">
			<input type="button" value="폴더만들기">
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
					while(iter.hasNext()) {
						int key = iter.next();
						String value = map.get(key);
						String type = value.substring(0, value.indexOf("$"));
						String name = value.substring(value.lastIndexOf("\\") + 1);
					%>
						<tr>
							<th>
								<%=type %>
							</th>
							<td>
								<% if(type.equals("[폴더]")) { %>
									<a href="#" onclick="goDir('<%=name %>');"><%=name %></a>
								<% }else { %>
									<a href="#" onclick="goDownload('<%=name %>');"><%=name %></a>
								<% } %>
							</td>
							<td>
								<input type="button" name="del" id="del" class="del_btn" value="Delete">	
							</td>
						</tr>
					<% } %>
					</tbody>
				</table>
			</form>
		</fieldset>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>