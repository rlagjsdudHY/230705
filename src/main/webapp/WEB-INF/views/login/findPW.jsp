<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/style/style.css">
<link rel="stylesheet" href="/style/style_findID.css">
</head>
<body>
	<div id="wrapLogin">
		<h1>ID, 이름, 전화번호 입력</h1>
		<hr>
		<div id="loginArea">
			<form action="/findPWSuc">
				<table id="loginTblArea">
					<tbody>
						<tr>
							<td>
								<input type="text" name="uid" id="uid" placeholder="ID">
							</td>
							<td rowspan="3">
								<button type="submit" id="findPWBtn">
									<img src="../images/icon03_FindPW.png" alt="">
									<span>P/W 찾기</span>
								</button>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" name="uname" id="uname" placeholder="이름">
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" name="phone" id="phone"
								placeholder="전화번호 (- 포함해서 입력해주세요.)">
							</td>
						</tr>
					</tbody>
				</table>
				<div id="findPWBtnArea">
					<button type="reset">다시 입력</button>
					<button type="button" id="back">돌아가기</button>
				</div>
			</form>
		</div>
		<!-- div#loginArea -->
		
	</div>
	<!-- div#wrap -->
	<script src="/script/jquery-3.6.4.min.js"></script>
	<script src="/script/script.js"></script>
	<script>
		$(document).ready(function(){
			let msg = "${msg}";
			if (msg != "") {
				alert(msg);
			}
		});
		
		
		$(function(){
			$("button#back").click(function(){
				location.href="login";
			});
			
			$("button#findPWBtn").click(function(){
				let phoneRule = /^\d{3}-\d{4}-\d{4}$/;
				if ($("#uid").val() == null || $("#uid").val() == "") {
					alert("아이디 입력해주세요.");
					$("#uid").focus();
					return false;
				} else if ($("#uname").val() == null || $("#uname").val() == "") {
					alert("이름을 입력해주세요.");
					$("#uname").focus();
					return false;
				} else if ($("#phone").val() == null || $("#phone").val() == "") {
					alert("전화번호를 입력해주세요.");
					$("#phone").focus();
					return false;
				} else if (!phoneRule.test($("#phone").val())) {
					alert("전화번호 형식에 맞게 입력해주세요.");
					$("#phone").focus();
					return false;
				} else {
					let result = confirm("비밀번호를 찾으시겠습니까?");
					if (result == false) {
						return false;
					}
				}
			
			});
			
		});
	</script>
</body>
</html>