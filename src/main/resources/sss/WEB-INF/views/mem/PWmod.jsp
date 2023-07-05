<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang ="ko">
	<head>
		<meta charset="UTF-8">
		<title>Document</title>
		<link rel="stylesheet" href="/style/style.css">
		<link rel="stylesheet" href="/style/style_Template.css">
		<link rel="stylesheet" href="/style/style_mypage.css">
	</head>
	<body>
		<div id="wrap">
			<!--  헤더템플릿 시작 -->
			<%@ include file="/WEB-INF/views/ind/headerTmp.jsp" %>
	    	<!--  헤더템플릿 끝 -->   
	    	
	    	<main id="main" class="dFlex">
	    	
	    		<div id="lnb">
		    		<!--  메인 LNB 템플릿 시작 -->
					<%@ include file="/WEB-INF/views/ind/mainLnbTmp.jsp" %>
		    		<!--  메인 LNB 템플릿 끝 -->    	
    			</div>
    			
    			<!-- 실제 작업 영역 시작 -->
	    		<div id="contents" class="pwChkDiv">
	
					
		        	<form id="pwChngFrm">
			        	<div id="pwChkArea">	       
			        		<div id="PwInput">
				        		<table>
				        			<thead>
				        				<tr>
				        					<th colspan="2">${pwMod.uid } 님 비밀번호 수정</th>
				        				</tr>
				        			</thead>
				        			<tbody>
				        				<tr>
				        					
				        					<th>현재 비밀번호</th>
				        					<td>
				        					<input type="hidden" name="uid" id="uid" value="${pwMod.uid }">
				        					<input type="hidden" id="nowPwChk" value="${pwMod.upw }">
				        					<input type="password" id="nowPw" name="nowPw"
				        					autofocus>
				        					</td>
				        				</tr>
				        				<tr>
				        					<th>새 비밀번호</th>
				        					<td><input type="password" id="upw" name="upw"></td>
				        				</tr>
				        				<tr>
				        					<th>새 비밀번호 확인</th>
				        					<td>
				        					<input type="password" id="upwRe">
											<span id="pwChk"></span>		        					
				        					</td>
				        				</tr>
				        			</tbody>
				        		</table>
	
			        		</div>
			        		<div id="btnArea">
			        			<button type="button" id="pwChng">변경</button>
			        		</div>
			        		
			        	</div>
			        	<!-- div#PwChkArea -->
		        	</form>
		        	
		        	
	
	    		</div>
	    		<!-- 실제 작업 영역 끝 div.loginDiv -->
    		
    		</main>
    		
    			    	
	    	<!--  푸터템플릿 시작 -->
	    	<%@ include file="/WEB-INF/views/ind/footerTmp.jsp" %>
	    	<!--  푸터템플릿 끝 --> 
				
		
		</div>
		<!-- #wrap -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  		<script src="/script/script.js"></script>
  		
  		 <script>

        $(function(){
        	$("button#pwChng").click(function(){
				
        		let uid = $("#uid").val().trim();		
        		$("#uid").val(uid);
        		
        		let nowPw = $("#nowPw").val().trim();
        		$("#noPw").val(nowPw);
        		
        		let nowPwChk = $("#nowPwChk").val().trim();
        		$("#nowPwChk").val(nowPwChk);
        		
        		let upw = $("#upw").val().trim();
        		$("#upw").val(upw);
        		
        		let upwRe = $("#upwRe").val().trim();
        		
        	
            	 if (nowPw == "" ){
            		alert("현재 비밀번호를 입력해주세요.");
         			$("#nowPw").focus();
             	} else if (upw=="") { 
	             
	             	alert("새 비밀번호를 입력해주세요.");
	             	$("#upw").focus();
	         	} else if(upwRe=="") {
	         		alert("새 비밀번호 확인을 입력해주세요.");
	    			$("#upwRe").focus();
	         	} else if(upw != upwRe){
	         		alert("새 비밀번호 일치여부를 확인해주세요.");
	    			$("#upw").focus();
	         		
	        	}else if(nowPw == upw){
	        		alert("새 비밀번호가 기존 비밀번호와 동일합니다.");
	    			$("#upwRe").focus();
	         	}else if(nowPw != nowPwChk ){
	         		alert("현재 비밀번호가 옳바르지 않습니다.");
	    			$("#nowPw").focus();
	         	
	         	}else{
	         		let chkSbmTF = confirm("비밀번호를 수정 하시겠습니까?");
	        		if (chkSbmTF) {
	        			$("#pwChngFrm").attr("action", "pwModProc");
	        			$("#pwChngFrm").submit();
	         		}
	         	}
            	 
            	 /* 폼실행 엔터키 이벤트 처리 */
	         	
             
			});
        
            		$(window).keydown(function(){
            			let code = event.keyCode;
            			if (code == 13) return false;
            		});
        	
        });
        </script>
	</body>
</html>