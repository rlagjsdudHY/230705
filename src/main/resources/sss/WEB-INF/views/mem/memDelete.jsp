<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>회원탈퇴</title>
		<link rel="stylesheet" href="/style/style.css">
		<link rel="stylesheet" href="/style/style_Template.css">
		<link rel="stylesheet" href="/style/style_mypage.css">
		<style>
		
		</style>
	</head>
	<body>
		<div id="wrap">
			<h1>회원탈퇴</h1>
			<hr>
			<form action="" id="memDelete">
			<div>비밀번호 <span><input type="text" name="upw"></span></div>
			<button type="submit" id="memsubmit">탈퇴하기</button>
			</form>
		</div>	
		<!-- div#wrap -->
		<script src="/script/jquery-3.6.4.min.js"></script>
        <script src="/script/script.js"></script>	
         <script>
        	$(function(){
				     $("#memsubmit").click(function(){
				    	 let result = confirm("정말 탈퇴 하시겠습니까?");
				    	 if(result){
				    		 $("#memDelete").attr("action","memDeleteProc");
				    		 $("#memDelete").submit();
				    	 }   
				    	 
				     });
        	});
        </script>
	</body>
</html>
   
 