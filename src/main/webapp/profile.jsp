<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Profile</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/test/css/profile.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/test/css/mainLayout.css">
</head>
<body>
<%@ include file="header.jsp" %>
    <div id="profile_body">
        <div class="div1">
            <img src="<%=request.getContextPath() %>/test/img/book.png" alt="Book Img">
        </div>
        <div class="div2">
            <p>
                <strong id="sp1">Lorem Ipsum</strong>
                is simply of
                <strong id="sp2">The printing</strong>
                typesetting industry.
            </p>
            <p>Why do we use it?</p>
            <p>The generated Lorem Ipsum is therefore.</p>
        </div>
        <div class="div3">
            <div id="sec1">
                <img src="<%=request.getContextPath() %>/test/img/20090206070914_9902.jpg" alt="First Man">
            </div>
            <div id="sec2">
                <div class="space">
                    <!-- 공백 -->
                </div>
                <div id="intro1">
                    <strong id="str1">Neque Parrot</strong>
                    <p>
                        ' <strong>The point</strong> of using <strong>Lorem Ipsum</strong> is that '
                    </p>
                    <hr>
                    <p>- There are many variations.</p>
                    <p>- But the majority have suffered.</p>
                    <p>- Alteration in some form.</p>
                    <p>- By injected humour.</p>
                    <p>- Randomised words which don't look.</p>
                    <p>- Slightly believable.</p>
                </div>
            </div>
        </div>
        <div class="div4">
            <div id="sec3">
                <img src="<%=request.getContextPath() %>/test/img/20090206070914_5828.jpg" alt="Second Man">
            </div>
            <div id="sec4">
                <div class="space">
                    <!-- 공백 -->
                </div>
                <div id="intro2">
                    <strong id="str2">Brandon Francisco</strong>
                    <p>
                        ' <strong>The point</strong> of using <strong>Lorem Ipsum</strong> is that '
                    </p>
                    <hr>
                    <p>- There are many variations.</p>
                    <p>- But the majority have suffered.</p>
                    <p>- Alteration in some form.</p>
                    <p>- By injected humour.</p>
                    <p>- Randomised words which don't look.</p>
                    <p>- Slightly believable.</p>
                </div>
            </div>
        </div>
    </div>
<%@ include file="footer.jsp" %>
</body>
</html>