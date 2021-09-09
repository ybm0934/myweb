<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="yong.member.abcd" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="edao" class="yong.member.abcd" />
<%    
String id_value = request.getParameter("id");
int result=edao.idCheck(id_value);
if(id_value==null||id_value==""){
   %>
   <script>
   window.alert('아이디를 입력해주세요');
   location.href='a2.jsp';
   </script>
   <%
}else if(result==1){
      %>
      <script>
      window.alert('중복된 아이디입니다.다시 입력해주세요');
      location.href='a2.jsp';
      </script>
      <%
}else{
   %>
   <script>
   window.alert('사용가능한 아이디입니다.');
   var userId='<%=id_value%>';
   opener.document.join.id.value=userId;
   window.self.close();
   </script>
   <%
}
%>