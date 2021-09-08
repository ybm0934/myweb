<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <form name="fm" method="POST" action="<%=request.getContextPath() %>/test2/beanTest_ok2.jsp">
        <h1>정보 입력</h1>
        <table>
            <tr>
                <th>이름</th>
                <td>
                    <input type="text" class="box" name="name">
                </td>
            </tr>
            <tr>
                <th>나이</th>
                <td>
                    <input type="text" class="box" name="age">
                </td>
            </tr>
            <tr>
                <th>전화</th>
                <td>
                    <input type="text" class="box" name="tel">
                </td>
            </tr>
            <tr>
                <th>주소</th>
                <td>
                    <input type="text" class="box" name="addr">
                </td>
            </tr>
            <tr>
                <th colspan="2">
                    <input type="submit" class="btn" value="전달하기">
                </th>
            </tr>
        </table>
    </form>
</body>
</html>