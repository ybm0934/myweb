<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = (String) session.getAttribute("userid");
	String userName = (String) session.getAttribute("userName");
	System.out.println("userid : " + userid);
	System.out.println("userName : " + userName);
	
	boolean isLogin = false;
	if(userid != null && !userid.isEmpty()){
		isLogin = true;
	}
	System.out.println("isLogin = " + isLogin);
%>
<script>
	<%-- window.onload = function(){
		var isLogin = document.getElementById('isLogin').value;
		
		if(isLogin == 'false'){
			alert('로그인 하셔야 합니다.');
			location.href = '<%=request.getContextPath()%>/index.jsp';
		}
	} --%>

	function login(){
		var href = '<%=request.getContextPath() %>/member/login.jsp';
		var title = 'LOGIN';
		var w = 600;
		var y = 450;
		var left = (window.screen.width / 2) - (w / 2);
		var top = (window.screen.height / 2) - (y / 2);
		window.open(href, title, 'width = ' + w + ', height = ' + y + ', left = ' + left + ', top = ' + top);
	}
</script>
<header>
<input type="hidden" id="isLogin" value="<%=isLogin %>">
        <div>
			<% if(isLogin == false){ %>
        	<a href="#" onclick="login();">로그인</a>
        	 | 
        	<a href="<%=request.getContextPath() %>/member/register.jsp">회원가입</a>
			<% }else if(isLogin == true) { %>
        	<span><%=userName %>님 반갑습니다.</span>
        	<a href="<%=request.getContextPath() %>/member/logout.jsp">로그아웃</a>
			<% } %>
        </div>
        <h1>JSP Study Site</h1>
        <nav>
            <ul>
                <li>
                    <a href="<%=request.getContextPath() %>/index.jsp">Home</a>
                </li>
                <li>
                    <a href="<%=request.getContextPath() %>/profile.jsp">Profile</a>
                </li>
                <li>
                    <a href="#">Board</a>
                </li>
                <li>
                    <a href="<%=request.getContextPath() %>/webFolder/webFolder.jsp">WebFolder</a>
                </li>
                <li>
                    <a href="#">GuestBook</a>
                </li>
            </ul>
        </nav>
        <hr>
</header>