<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" href="/style/style.css">
<style>
div#headerLogo {
	text-align: center;
}

main#main {
	text-align: center;
	padding: 20px;
}

p {
	margin: 20px;
}

#btnArea button {
	font-size: 20px;
	padding: 10px 15px;
	border-radius: 6px;
	border: 1px solid #eee;
	background-color: rgba(0, 109, 41, 0.1);
	color: #006a26;
	margin: 10px;
}
</style>
</head>
<body>
	<div id="wrap">
		<div id="headerLogo">
			<a href="/"> <img src="/images/logo.png" alt="헤더로고이미지">
			</a>
		</div>
		<hr>
		<main id="main">
			<h1>회원가입 완료</h1>
			<p>Ezen PC 회원가입이 정상으로 처리 되었습니다.</p>

			<div id="btnArea">
				<button id="loginButton">로그인</button>
				<button id="mainButton">메인페이지</button>
			</div>
		</main>
	</div>
	<!-- div#wrap -->
	<script src="/script/jquery-3.6.4.min.js"></script>
	<script src="/script/script.js"></script>
	<script>
		$(document).ready(function() {
			$('#loginButton').click(function() {
				redirectToLogin();
			});

			$('#mainButton').click(function() {
				redirectToMain();
			});

			function redirectToLogin() {
				window.location.href = "/login";
			}

			function redirectToMain() {
				window.location.href = "/main";
			}
		});
	</script>
</body>
</html>

