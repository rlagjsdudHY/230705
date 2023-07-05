<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 
<!DOCTYPE html>
<html lang="ko">
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
    			<div id="mainTbl">
				    <c:forEach var="mypage" items="${mypageInfo}">
				    <table>
				        <tbody>
				            <tr>
				                <td colspan="2">회원정보</td>
				            </tr>
				            <tr>
				                <td>아이디</td>
				                <td>${mypage.uid}</td>
				            </tr>
				            <tr>
				                <td>이름</td>
				                <td> ${mypage.uname}</td>
				            </tr>
				            <tr>
				                <td>전화번호</td>
				                <td><c:out value="${mypage.phone}" /></td>
				            </tr>
				            <tr>
				                <td>주소</td>
				                <td><c:out value="${mypage.address}" /></td>
				            </tr>
				            <tr>
				                <td>이메일</td>
				                <td><c:out value="${mypage.email}" /></td>
				            </tr>
				        </tbody>
				    </table>
				    <input type="hidden" name="num" form="modifyFrm" value="${mypage.num}">
					</c:forEach>
					
					<div id="btnArea">
		    			<button id="modify" form="modifyFrm">수정하기</button>
		    			<button onclick="location.href='/'">메인페이지</button>
		    		</div>
    			</div>
	    	</main>
	    	<!-- main#main -->
	    	
    		<form action="" id="modifyFrm" method="post"></form>
	    	
	    	<!--  푸터템플릿 시작 -->
	    	<%@ include file="/WEB-INF/views/ind/footerTmp.jsp" %>
	    	<!--  푸터템플릿 끝 --> 
				
	
		</div>
		<!-- #wrap -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
		<script src="/script/script.js"></script>
		<script>
		$(function(){
			$("#modify").click(function(){
				$("#modifyFrm").attr("action","memModifyProc?gnbParam=myPage");
				$("#modifyFrm").submit();
			});
		});
		</script>
	</body>
</html>