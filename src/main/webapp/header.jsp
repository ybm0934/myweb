<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
        <div>
        	<a href="<%=request.getContextPath() %>/member/login.jsp">로그인</a>
        	 | 
        	<a href="<%=request.getContextPath() %>/member/register.jsp">회원가입</a>
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
                    <a href="#">WebFolder</a>
                </li>
                <li>
                    <a href="#">GuestBook</a>
                </li>
            </ul>
        </nav>
        <hr>
</header>