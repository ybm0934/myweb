<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "YBM";
	String pwd = "1234";
	
	Connection con = DriverManager.getConnection(url, user, pwd);
	
	String word = request.getParameter("word");
	if(word == null) word = "";
	String[] select = {""};
	String where = "";
	
	if(request.getParameterValues("select") != null){
		select = request.getParameterValues("select");
		
		if (select[0].equals("empno")) {
			where += " where empno like ?";
		} else if (select[0].equals("name")) {
			where += " where name like ?";
		} else if (select[0].equals("email")) {
			where += " where email like ?";
		} else if (select[0].equals("dept")) {
			where += " where dept like ?";
		}
	}

	String sql = "select * from employee" + where + " order by empno";
	
	PreparedStatement ps = con.prepareStatement(sql);
	
	if(where.length() > 0){
		ps.setString(1, word);
	}
	
	ResultSet rs = ps.executeQuery();
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
			location.href = 'empEdit.jsp?empno='+ empno;
		}
		
		function goDelete(empno){
			location.href = 'empDelete.jsp?empno='+ empno;
		}
		
		function goAdd(){
			location.href = "empAdd.jsp";
		}
</script>
</head>

<body>
<%@ include file="header.jsp" %>
    <div id="article">
        <div id="section">
            <h1>사원 관리 프로그램</h1>
            <form name="listForm" action="empList.jsp">
	            <div id="search-div">
	            	<select name="select" id="search-select">
	            		<option value="empno" <%if(select[0].equals("empno")){ %> selected <%} %>>사원번호</option>
	            		<option value="name" <% if(select[0].equals("name")){ %> selected="selected" <%} %>>이름</option>
	            		<option value="email" <% if(select[0].equals("email")){ %> selected="selected" <%} %>>E-mail</option>
	            		<option value="dept" <% if(select[0].equals("dept")){ %> selected="selected" <%} %>>부서명</option>
	            	</select>
	            	<input type="text" name="word" id="word" class="box"  value="<%= word %>">
	            	<input type="submit" value="검색" class="btn3">
	            	<input type="button" value="등록하기" class="btn4" onclick="goAdd();">
	            </div>
            </form>
            <fieldset>
                <legend>사원보기</legend>
               	<% if(!(rs.next())){ %>
                	<div id="no-data">
                		<p>등록된 사원이 없습니다.</p>
                	</div>
               	<% }else { %>
                	<% do { %>
                        <table class="tb1" summary="사원 표">
                        <caption class="cap">사원 표</caption>
                            <tr>
                                <th>사원이름</th>
                                <td>
                                    <input type="text" name="name" class="box" value="<%=rs.getString("name") %>"
                                    readonly="readonly">
                                </td>
                            </tr>
                            <tr>
                                <th>E-mail</th>
                                <td>
                                    <input type="text" name="email" class="box" value="<%=rs.getString("email") %>"
                                    readonly="readonly">
                                </td>
                            </tr>
                            <tr>
                                <th>부서명</th>
                                <td>
                                    <input type="text" name="dept" class="box" value="<%=rs.getString("dept") %>"
                                    readonly="readonly">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <input type="button" value="수정하기" class="btn btn1" onclick="goEdit('<%=rs.getInt("empno") %>')">
                                    <input type="button" value="삭제하기" class="btn btn2" onclick="goDelete('<%=rs.getInt("empno") %>')">
                                </td>
                            </tr>
                        </table>
					<% }while(rs.next()); %>
				<% } %>
            </fieldset>
        </div>
    </div>
<%@ include file="footer.jsp" %>
</body>

</html>

<%
	rs.close();
	ps.close();
	con.close();
%>