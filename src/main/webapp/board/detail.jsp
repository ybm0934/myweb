<%@page import="yong.board.BoardDTO"%>
<%@page import="yong.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String no = request.getParameter("no");

	BoardDAO boardDao = new BoardDAO();
	BoardDTO boardDto = new BoardDTO();
	
	boardDto = boardDao.detail(Integer.parseInt(no));
	
	String fileName = boardDto.getFileName();
	int downCount = boardDto.getDownCount();
	
	String attatch = (fileName == null) ? "" : fileName + "(" + downCount + ")";
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>글 상세보기</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/board/css/detail.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function(){
        	$('#list_btn').click(function(){
        		location.href = '<%=request.getContextPath() %>/board/list.jsp';
        	});
        	
        	// 답변 쓰기 이동
        	$('#reWrite_btn').click(function(){
        		location.href = '<%=request.getContextPath() %>/board/reWrite.jsp?no=<%=no %>&groupno=<%=boardDto.getGroupno()%>&step=<%=boardDto.getStep()%>&sortno=<%=boardDto.getSortno()%>&title=<%=boardDto.getTitle()%>';
        	});
            
            // 댓글 등록 Ajax
            $('#reply_regit_btn').click(function(){
                $.ajax({
                   url : '<%=request.getContextPath() %>/board/reply.jsp',
                   type : 'POST',
                   data : {},
                   datatype : 'JSON',
                   success : function(data){
                       
                   },
                   error : function(){
                       alert('댓글 등록 실패');
                   }
                });

            }) // 댓글 등록 Ajax

            // 대댓글 창 띄우기
            var flag = false;

            $('#number').click(function(){
                var recomment = '';
                    recomment += '<tr class="rr_tr">';
                    recomment +=    '<th>닉네임</th>';
                    recomment +=    '<td>';
                    recomment +=        '<input type="text" name="name" class="textbox" id="name" placeholder="닉네임 입력" spellcheck="false">';
                    recomment +=    '</td>';
                    recomment +=    '<th>비밀번호</th>';
                    recomment +=    '<td>';
                    recomment +=        '<input type="password" name="pwd" class="textbox" id="pwd" placeholder="비밀번호 입력">';
                    recomment +=    '</td>';
                    recomment += '</tr>';
                    recomment += '<tr class="underline_tr rr_tr">';
                    recomment +=    '<td colspan="4" style="text-align: right;">';
                    recomment +=        '<textarea class="re_textarea" id="write_rere_textarea" placeholder="~님께 답글쓰기" spellcheck="false"></textarea>';
                    recomment +=        '<br><br>';
                    recomment +=        '<input type="button" class="re_btn" id="rere_cancel_btn" value="취소">&nbsp;';
                    recomment +=        '<input type="button" class="re_btn regit_btn" id="rere_regit_btn" value="등록">';
                    recomment +=    '</td>';
                    recomment += '</tr>';

                    if(flag == false) {
                        $('tr').has('#number').after(recomment);
                    }else {
                        return false;
                    }
                    
                    flag = true;
                
                $('#rere_cancel_btn').click(function(){
                    $('tr').has('#number').siblings('.rr_tr').remove();
                    flag = false;
                });
            }); // 대댓글 창 띄우기
        });
    </script>
</head>
<body>
    <div id="wrap">
		<h1>글 상세보기</h1>
		<table id="write_table">
		    <caption>글 상세보기 테이블</caption>
		    <thead></thead>
		    <tfoot>
		        <tr>
		            <td colspan="4">
		                <input type="button" class="btn" id="list_btn" value="목록">
		                <input type="button" class="btn" id="reWrite_btn" value="답변쓰기">
		                <input type="submit" class="btn" id="write_btn" value="수정하기">
		                <input type="button" class="btn" id="cancel_btn" value="삭제하기">
		            </td>
		        </tr>
		    </tfoot>
		    <tbody>
		        <tr>
		            <td colspan="4" id="title_td"><%=boardDto.getTitle() %></td>
		        </tr>
		        <tr>
		            <th>닉네임</th>
		            <td><%=boardDto.getName() %></td>
		            <th>조회수</th>
		            <td><%=boardDto.getCount() %></td>
		        </tr>
		        <tr>
		            <th>첨부파일</th>
		            <td colspan="3">
		            	<a href="#"><%=attatch %></a>
		            </td>
		        </tr>
		        <tr>
		            <td colspan="4">
		            	<div id="content"><%=boardDto.getContent() %></div>
		            </td>
		        </tr>
		    </tbody>
		</table>
		<h3>댓글 9</h3>
        <table id="reply_table">
			<caption>댓글 테이블</caption>
			<thead></thead>
			<tfoot>
                <tr>
                    <th>닉네임</th>
                    <td>
                        <input type="text" name="name" class="textbox" id="name" placeholder="닉네임 입력" spellcheck="false">
                    </td>
                    <th>비밀번호</th>
                    <td>
                        <input type="password" name="pwd" class="textbox" id="pwd" placeholder="비밀번호 입력">
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: right;">
                        <textarea class="re_textarea" id="write_reply_textarea" placeholder="댓글을 입력해주세요." spellcheck="false"></textarea>
                        <br><br>
                        <input type="button" class="re_btn regit_btn" id="reply_regit_btn" value="등록">
                    </td>
                </tr>
			</tfoot>
			<tbody>
                <tr class="underline_tr">
                    <th>지존법사</th>
                    <td colspan="3">2020.02.02.</td>
                </tr>
                <tr class="underline_tr">
                    <td colspan="4">
                        <span class="comment">
                            댓글을 썼습니다.
                            <br>
                            댓글을 썼습니다.
                            <br>
                            댓글을 썼습니다.
                            <br>
                            댓글을 썼습니다.
                            <br>
                            댓글을 썼습니다.
                        </span>
                        <br><br>
                        <span class="re_spn" id="number">답글쓰기</span>
                    </td>
                </tr>
                <tr class="underline_tr">
                    <td colspan="4">
                        <span class="comment">
                            댓글을 썼습니다.
                            <br>
                            댓글을 썼습니다.
                            <br>
                            댓글을 썼습니다.
                            <br>
                            댓글을 썼습니다.
                            <br>
                            댓글을 썼습니다.
                        </span>
                        <br><br>
                        <span class="re_spn" id="number2">답글쓰기</span>
                    </td>
                </tr>
            </tbody>
		</table>
    </div>
</body>
</html>