<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폼 테스트</title>
<link rel="stylesheet" type="text/css" href="test/css/mainLayout.css">
<link rel="stylesheet" type="text/css" href="test/css/formTest.css">
</head>
<body>
	<%@ include file="header.jsp"%>
	<div>
		<div>
			<h1>폼 테스트 페이지</h1>
			<form name="fm" method="get" action="formTest_ok.jsp">
				<fieldset>
					<legend>폼 테스트</legend>
					<ul>
						<li>
							<label>이름</label>
							<input type="text" name="name">
						</li>
						<li>
							<label>비밀번호</label>
							<input type="password" name="pwd">
						</li>
						<li>
							<label>성별</label>
							<input type="radio" name="gender" value="남자">남자
							<input type="radio" name="gender" value="여자">여자
							<input type="radio" name="gender" value="중성">중성
						</li>
						<li>
							<label>취미</label>
							<input type="checkbox" name="hobby" value="공부">공부
							<input type="checkbox" name="hobby" value="운동">운동
							<input type="checkbox" name="hobby" value="먹기">먹기
							<input type="checkbox" name="hobby" value="독서">독서
							<input type="checkbox" name="hobby" value="게임">게임
							<input type="checkbox" name="hobby" value="산책">산책
							<input type="checkbox" name="hobby" value="드라이브">드라이브
						</li>
					</ul>
					<div id="btn-div">
						<input type="submit" value="데이터 넘기기">
						<input type="reset" value="데이터 초기화">
					</div>
				</fieldset>
			</form>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>