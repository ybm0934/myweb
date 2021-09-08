<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.util.*" %>
<%@ page import="yong.emp.EmpDTO" %>
<jsp:useBean id="edto" class="yong.emp.EmpDTO" />
<jsp:setProperty property="*" name="edto"/>
<jsp:useBean id="edao" class="yong.emp.EmpDAO" />

<%
	String category = request.getParameter("category");
	String word = request.getParameter("word");
	
	if(category == null) category = "";
	if(word == null) word = "";
	
	List<EmpDTO> list = edao.empList(category, word);
	
	// 페이징 처리
	int currentPage = 1;
	
	if(request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	int totalRecord = list.size();
	int pageSize = 5;
	int totalPage = (int) Math.ceil(totalRecord / pageSize);
	int blockSize = 5;
	int firstPage = currentPage - ((currentPage - 1) % blockSize);
	int lastPage = firstPage + (blockSize - 1);
	int curPos = (currentPage - 1) * pageSize;
	int num = totalRecord - curPos;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 보기</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/test/css/mainLayout.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/test/css/empList.css">
<script src="<%=request.getContextPath() %>/lib/jquery-3.6.0.min.js"></script>
<script>
		function goEdit(empno){
			location.href = 'empEdit2.jsp?empno='+ empno;
		}
		
		function goDelete(empno){
			location.href = 'empDelete2.jsp?empno='+ empno;
		}
		
		function goAdd(){
			location.href = 'empAdd2.jsp';
		}
</script>
</head>

<body>
<%@ include file="../header.jsp" %>
    <div id="article">
        <div id="section">
            <%@ include file="empHome.jsp" %>
            <form name="listForm" action="empList2.jsp">
	            <div id="search-div">
	            	<select name="category" id="search-select">
	            		<option value="empno" <%if(category.equals("empno")){ %> selected="selected" <%} %>>사원번호</option>
	            		<option value="name" <%if(category.equals("name")){ %> selected="selected" <%} %>>이름</option>
	            		<option value="email" <%if(category.equals("email")){ %> selected="selected" <%} %>>E-mail</option>
	            		<option value="dept" <%if(category.equals("dept")){ %> selected="selected" <%} %>>부서명</option>
	            	</select>
	            	<input type="text" name="word" id="word" class="box" value="<%=word %>">
	            	<input type="submit" value="검색" class="btn3">
	            	<input type="button" value="등록하기" class="btn4" onclick="goAdd();">
	            </div>
            </form>
            <fieldset>
                <legend>사원보기</legend>
               	<% if(list.size() == 0){ %>
                	<div id="no-data">
                		<p>등록된 사원이 없습니다.</p>
                	</div>
               	<% }else { %>
                	<% /* for(int i = 0; i < list.size(); i++){ 
                		EmpDTO dto = list.get(i); */
                		
                		for(int i = 1; i <= pageSize; i++) {
                			if(num < 1) break;
                			EmpDTO dto = list.get(curPos++);
                			num--;
                	%>
                        <table class="tb1" summary="사원 표">
                        <caption class="cap">사원 표</caption>
                            <tr>
                                <th>사원이름</th>
                                <td>
                                    <input type="text" name="name" class="box" value="<%=dto.getName() %>"
                                    readonly="readonly">
                                </td>
                            </tr>
                            <tr>
                                <th>E-mail</th>
                                <td>
                                    <input type="text" name="email" class="box" value="<%=dto.getEmail() %>"
                                    readonly="readonly">
                                </td>
                            </tr>
                            <tr>
                                <th>부서명</th>
                                <td>
                                    <input type="text" name="dept" class="box" value="<%=dto.getDept() %>"
                                    readonly="readonly">
                                </td>
                            </tr>
                            <tr>
                                <th>입사날짜</th>
                                <td>
                                    <input type="text" name="dept" class="box" value="<%=dto.getRegdate() %>"
                                    readonly="readonly">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <input type="button" value="수정하기" class="btn btn1" onclick="goEdit('<%=dto.getEmpno() %>')">
                                    <input type="button" value="삭제하기" class="btn btn2" onclick="goDelete('<%=dto.getEmpno() %>')">
                                </td>
                            </tr>
                        </table>
					<% } %>
				<% } %>
	        <input type="hidden" name="currentPage" value="<%=currentPage %>">
	        <div class="paging">
		        <%if(firstPage < 1) { %>
		        	<a href="<%=request.getContextPath() %>/emp2/empList2.jsp?currentPage=<%=firstPage - 1 %>" >◀◀</a>
		        <%} %>
		        
		        <%for(int i = firstPage; i <= lastPage; i++) { %>
		        	<a href="<%=request.getContextPath() %>/emp2/empList2.jsp?currentPage=<%=currentPage %>" ><%=i %></a>
		        <%} %>
		        
		        <%if(lastPage < totalPage) { %>
		        	<a href="<%=request.getContextPath() %>/emp2/empList2.jsp?currentPage=<%=lastPage + 1 %>" >▶▶</a>
		        <%} %>
	        </div>
            </fieldset>
        </div>
    </div>
<%@ include file="../footer.jsp" %>
</body>

</html>