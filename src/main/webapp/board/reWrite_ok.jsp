<%@page import="yong.board.BoardDAO"%>
<%@page import="yong.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int groupno = Integer.parseInt(request.getParameter("groupno"));
	int step = Integer.parseInt(request.getParameter("step"));
	int sortno = Integer.parseInt(request.getParameter("sortno"));

	BoardDTO boardDto = new BoardDTO();
	boardDto.setName(name);
	boardDto.setPwd(pwd);
	boardDto.setTitle(title);
	boardDto.setContent(content);
	boardDto.setGroupno(groupno);
	boardDto.setStep(step);
	boardDto.setSortno(sortno);
	
	BoardDAO boardDao = new BoardDAO();
	int cnt = boardDao.reply(boardDto);
%>
<% if(cnt > 0) { %>
	<script>
		location.href = '<%=request.getContextPath() %>/board/list.jsp';
	</script>
<%}else { %>
	<script>
		alert('답글쓰기 실패!');
		history.back();
	</script>
<%} %>