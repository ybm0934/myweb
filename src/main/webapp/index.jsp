<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/test/css/mainLayout.css">
</head>
<body>
<%@include file="header.jsp" %>
    <section id="mainSec">
        <article id="mainImg">
            <img src="<%=request.getContextPath() %>/test/img/main.jpg" alt="메인 대표 이미지">
        </article>
        <article id="minMenu">
            <h2>안녕하세요.</h2>
            <ul>
                <li>아래에 기능들이 추가될 것임</li>
                <li><a href="formTest.jsp">폼 테스트</a></li>
                <li><a href="cal.jsp">사칙 계산기</a></li>
                <li><a href="empList.jsp">사원 관리 프로그램(원시형)</a></li>
            </ul>
        </article>
    </section>
<%@include file="footer.jsp" %>
</body>
</html>