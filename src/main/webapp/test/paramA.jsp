<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h1>paramA.jsp</h1>
 <form name="paramA" action="test/paramB.jsp">
 이름 : <input type="text" name="name"><br>
 나이 : <input type="text" name="age"><br>
 <input type="submit" value="전달하기">
 </form>
</body>
</html>