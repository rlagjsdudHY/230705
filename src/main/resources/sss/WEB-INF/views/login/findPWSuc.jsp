<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>아이디 찾기 성공</title>
		<link rel="stylesheet" href="/style/style.css">
		<link rel="stylesheet" href="/style/style_login.css">
		<link rel="stylesheet" href="/style/style_Template.css">
	</head>
	<body>
		<div id="wrap">
			<header id="header">
				<div id="headerLogo">
					<a href="/">
						<img src="/images/logo.png" alt="헤더로고이미지">
					</a>
				</div>
				<hr>
			</header>
			
			<main id="main">
				<h2>${findPWSuc[0].uid} 계정 비밀번호 변경</h2>
				<div id="contents" class="pwChkDiv">
		        	<form id="pwChngFrm">
			        	<div id="pwChkArea">	       
			        		<div id="PwInput">
				        		<input type="hidden" name="uid" id="uid" value="${findPWSuc[0].uid}">
				        		<table>
				        			<tbody>
				        				<tr>
				        					<th>새 비밀번호</th>
				        					<td><input type="password" id="upw" name="upw"></td>
				        				</tr>
				        				<tr>
				        					<th>새 비밀번호 확인</th>
				        					<td>
				        						<input type="password" id="upwRe">      					
				        					</td>
				        				</tr>
				        			</tbody>
				        		</table>
			        		</div>
				        	<hr>
			        		<div id="btnArea">
			        			<button type="button" id="pwChng">변경하기</button>
			        		</div>
			        		
			        	</div>
			        	<!-- div#PwChkArea -->
		        	</form>
	    		</div>
			</main>
			<!-- main#main -->
			
			<!--  푸터템플릿 시작 -->
			<%@ include file="/WEB-INF/views/ind/footerTmp.jsp"%>
			<!--  푸터템플릿 끝 -->
			
		</div>
		<!-- div#wrap -->
		<script src="/script/jquery-3.6.4.min.js"></script>
		<script src="/script/script.js"></script>
		<script>
			$(function(){
	        	$("button#pwChng").click(function(){
					
	        		let uid = $("#uid").val().trim();		
	        		$("#uid").val(uid);
	        		
	        		let upw = $("#upw").val().trim();
	        		$("#upw").val(upw);
	        		
	        		let upwRe = $("#upwRe").val().trim();
	        		
	        	
	            	if (upw=="") { 
		             	alert("새 비밀번호를 입력해주세요.");
		             	$("#upw").focus();
		         	} else if(upwRe=="") {
		         		alert("새 비밀번호 확인을 입력해주세요.");
		    			$("#upwRe").focus();
		         	} else if(upw != upwRe){
		         		alert("입력한 비밀번호가 서로 일치하지 않습니다.");
		    			$("#upw").focus();
		         		
		        	} else {
		         		let chkSbmTF = confirm("비밀번호를 수정 하시겠습니까?");
		        		if (chkSbmTF) {
		        			$("#pwChngFrm").attr("action", "pwModProc2");
		        			$("#pwChngFrm").submit();
		         		}
		         	}
	            	 
				});
	        	
	        	/* 폼실행 엔터키 이벤트 처리 */
	      		$(window).keydown(function(){
	      			let code = event.keyCode;
	      			if (code == 13) return false;
	      		});
	        	
	        });
		</script>
	</body>
</html>