<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
header h1{
   text-align: center;
   font-size: 45px;
   color:skyblue;
   text-shadow: 5px 5px 5px darkblue;
}
body{
   width: 680px;
   text-align: center;
   margin:0px auto;
}
footer{
   text-align: center;
}
</style>
</head>
<body>
<header><h1>회원가입</h1></header>
<section>
   <article>
      <form name="join" action="a2.jsp">
      <table>
         <thead>회원가입</thead>
         <tbody>
            <tr>
               <th>아이디</th>
               <td>
               <input type="text" name="id" readonly>
               <input type="button" value="중복 검사" onclick="userId();">    
               </td>
            </tr>
            <tr>
               <th>비밀번호</th>
               <td><input type="password" name="pwd"></td>
            </tr>
            <tr>
               <th>이름</th>
               <td><input type="text" name="name"></td>
            </tr>
            <tr>
               <th>E-mail</th>
               <td><input type="text" name="email"></td>
            </tr>
            <tr>
               <th>전화번호</th>
               <td><select name="tel" >
                  <option>010</option>
                  <option>02</option>
                  <option>031</option>
                  <option>032</option>
                  <option>033</option>
                  <option>041</option>
                  <option>042</option>
                  <option>043</option>
                  <option>044</option>
                  <option>051</option>
                  <option>052</option>
                  <option>053</option>
                  <option>054</option>
                  <option>055</option>
                  <option>061</option>
                  <option>062</option>
                  <option>063</option>
                  <option>064</option>
                  </select>
                  -<input type="text" name="tel2" maxlength="4">
                  -<input type="text" name="tel3" maxlength="4">
               </td>
            </tr>
            <tr>
               <th>주소</th>
               <td><input type="text" name="addr"></td>
            </tr>
               <td colspan="2" align="center">
                  <input type="submit" value="가입하기">
                  <input type="reset" value="다시작성">
               </td>
            </tr>
         </tbody>
      </table>
      </form>
   </article>
</section>
<%@ include file="../footer.jsp" %>
<script>
   function userId(){
      window.open('a3.jsp');
   }
</script>
</body>
</html>