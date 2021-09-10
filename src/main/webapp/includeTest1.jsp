<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
   <article>
      <form name="fm" action="includeTest1.jsp">
      <fieldset>
         <legend>회원 검색</legend>
         <table>
            <tr>
               <th>아이디</th>
               <td><input type="text" name="name"></td>
               <td><input type="submit" value="검색" ></td>
            </tr>
         </table>
      </fieldset>
      </form>
      <hr>
      <jsp:include page="includeTest2.jsp"></jsp:include>
   </article>
</section>
</body>
</html>