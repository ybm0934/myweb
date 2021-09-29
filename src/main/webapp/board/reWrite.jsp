<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String no = request.getParameter("no");
	String groupno = request.getParameter("groupno");
	String step = request.getParameter("step");
	String sortno = request.getParameter("sortno");
	String title = request.getParameter("title");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>글쓰기</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/board/css/write.css">
    <script src="https://cdn.ckeditor.com/ckeditor5/29.2.0/classic/ckeditor.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    	$(document).ready(function(){
    		$('#write_btn').click(function(){
    		});
    		
    		$('#cancel_btn').click(function(){
    			if(confirm('내용이 모두 지워질 수 있습니다. 취소하시겠습니까?')){
    				location.href = '<%=request.getContextPath() %>/board/detail.jsp?no=<%=no %>';
    			}
    		});
    	});
    </script>
</head>
<body>
    <div id="wrap">
        <form name="write" method="post" action="<%=request.getContextPath() %>/board/reWrite_ok.jsp">
        <input type="hidden" name="groupno" value="<%=groupno %>">
        <input type="hidden" name="step" value="<%=step %>">
        <input type="hidden" name="sortno" value="<%=sortno %>">
            <h1>답변 글쓰기</h1>
            <table id="write_table">
                <caption>답변 글쓰기 테이블</caption>
                <thead></thead>
                <tfoot>
                    <tr>
                        <th colspan="2">
                            <input type="submit" class="btn" id="write_btn" value="등록하기">
                            <input type="button" class="btn" id="cancel_btn" value="취소하기">
                        </th>
                    </tr>
                </tfoot>
                <tbody>
                    <tr>
                        <th>닉네임</th>
                        <td>
                            <input type="text" name="name" class="textbox" id="name" placeholder="닉네임을 입력하세요." autofocus required>
                        </td>
                    </tr>
                    <tr>
                        <th>비밀번호</th>
                        <td>
                            <input type="password" name="pwd" class="textbox" id="pwd" placeholder="비밀번호를 입력하세요." required>
                        </td>
                    </tr>
                    <tr>
                        <th>제 목</th>
                        <td>
                            <input type="text" name="title" class="textbox" id="title" value="<%=title %>" placeholder="제목을 입력하세요." required>
                        </td>
                    </tr>
                    <tr>
                        <th>내 용</th>
                        <td>
                            <textarea name="content" id="editor"></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>
</body>
<script>
    ClassicEditor
        .create( document.querySelector( '#editor' ) )
        .catch( error => {
            console.error( error );
        } );
</script>
</html>