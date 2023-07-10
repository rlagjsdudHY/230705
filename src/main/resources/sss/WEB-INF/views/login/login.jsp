<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/style/style.css">
<link rel="stylesheet" href="/style/style_login.css">
</head>
<body>
	<div id="wrapLogin">
		<h1>로그인</h1>
		<hr>
		<div id="loginArea">
			<form action="/loginProc">
				<table id="loginTblArea">
					<tbody>
						<tr>
							<td><input type="text" name="uid" id="uid" placeholder="ID">
							</td>
							<td rowspan="2">
								<button type="submit" id="loginBtn">LOG IN</button>
							</td>
						</tr>
						<tr>
							<td><input type="password" name="upw" id="upw"
								placeholder="Password"></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<!-- div#loginArea -->

		<div id="optArea" class="dFlex">
			<div class="optIcon" onclick="location.href='/joinagree'">
				<figure>
					<img src="../images/icon01_Join.png" alt="">
				</figure>
				<span>회원가입</span>
			</div>
			<div>|</div>
			<div class="optIcon" onclick="location.href='/findID'">
				<figure>
					<img src="../images/icon02_FindID.png" alt="">
				</figure>
				<span>아이디 찾기</span>
			</div>
			<div>|</div>
			<div class="optIcon" onclick="location.href='/findPW'">
				<figure>
					<img src="../images/icon03_FindPW.png" alt="">
				</figure>
				<span>비밀번호 찾기</span>
			</div>
		</div>
		<!-- div#optArea -->
	</div>
	<!-- div#wrap -->
	<script src="/script/jquery-3.6.4.min.js"></script>
	<script src="/script/script.js"></script>
</body>
</html>