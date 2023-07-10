<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" href="/style/style.css">
<link rel="stylesheet" href="/style/style_Template.css">
<style>
#chatbot-window {
	display: none;
	position: fixed;
	bottom: 20px;
	right: 20px;
	width: 300px;
	height: 400px;
	border: 1px solid #ccc;
	background-color: #fff;
}

#chatbot-header {
	padding: 10px;
	background-color: #f2f2f2;
	border-bottom: 1px solid #ccc;
}

#chatbot-title {
	font-weight: bold;
}

#chatbot-content {
	height: 320px;
	overflow-y: auto;
	padding: 10px;
}

#chatbot-input {
	padding: 10px;
	border-top: 1px solid #ccc;
}

#chatbot-input-text {
	width: 200px;
}

#chatbot-input-submit {
	margin-left: 10px;
}

/* 추가된 CSS */
#chatbot-options-container {
	display: none;
	position: absolute;
	top: calc(100% + 10px); /* 선택 창이 메시지 입력칸 아래로 이동 */
	left: 0;
	width: 100%;
	background-color: #fff;
	border: 1px solid #ccc;
	padding: 10px;
}

.chat-option {
	cursor: pointer;
	margin-bottom: 5px;
}

.chat-option:hover {
	background-color: #f2f2f2;
}
</style>
</head>
<body>
	<div id="chatbot-bar">
		<button id="chatbot-button">Chatbot</button>
	</div>

	<div id="wrap">
		<header>
			<!--  헤더템플릿 시작 -->
			<%@ include file="/WEB-INF/views/ind/headerTmp.jsp"%>
			<!--  헤더템플릿 끝 -->
			<!-- 회원정보 목록 -->
			<%-- 			<c:forEach var="list" items="${memberList}">
				<div class="listRow listColumn dFlex" data-link="${list.num}">
					<span>${list.num}</span>&nbsp;
					<span>${list.uid}</span>&nbsp;
					<span>${list.UName}</span>&nbsp;
					<span>${list.phone}</span>&nbsp;
					<span>${list.address}</span>&nbsp;
					<span>${list.email}</span>&nbsp;
					<fmt:formatDate var="regTM" value="${list.regTM}" pattern="yyyy-MM-dd"/>
					<span>${regTM}</span>&nbsp;&nbsp;
					<span class="delIcon">&times;</span>
				</div>
			</c:forEach> --%>
		</header>
		<!-- 회원정보 목록 -->

		<!-- 			<div class="user-actions">
				<a href="로그인페이지주소">로그인</a> 
				<a href="회원가입페이지주소">회원가입</a> 
				<a href="장바구니페이지주소">장바구니</a>
			</div> 

		<div class="logo-search">
				<div class="logo">
					<img src="/images/logo.jpg" alt="로고">
				</div> -->


		<div class="search">
			<input type="text" placeholder="검색어를 입력해주세요.">
			<button type="submit">
				<img src="/images/search-icon.png" alt="검색">
			</button>
		</div>

		<div id="container">
			<div class="items">
				<div class="item active">
					<img src="/images/image1.jpg" alt="">
				</div>
				<div class="item">
					<img src="/images/image2.jpg" alt="">
				</div>
				<div class="item">
					<img src="/images/image3.jpg" alt="">
				</div>
				<div class="item">
					<img src="/images/image4.jpg" alt="">
				</div>
				<div class="item">
					<img src="/images/image5.jpg" alt="">
				</div>
				<div class="item">
					<img src="/images/image6.jpg" alt="">
				</div>
			</div>
			<button class="prev">이전</button>
			<button class="next">다음</button>
		</div>

		<div class="board">
			<c:forEach var="list" items="${main}">
				<div class="post" data-link="${list.pcNum}">
					<img src="/images/image1.jpg" alt="이미지1">
					<h3>${list.goodsName}${list.pcNum}</h3>
					<p>게시글 내용${list.pcNum}</p>
				</div>
			</c:forEach>
		</div>

		<!--  푸터템플릿 시작 -->
		<%@ include file="/WEB-INF/views/ind/footerTmp.jsp"%>
		<!--  푸터템플릿 끝 -->
	</div>
	<div id="chatbot-window">
		<div id="chatbot-header">
			<span id="chatbot-title">Chatbot</span>
		</div>
		<div id="chatbot-content"></div>
		<div id="chatbot-input">
			<input type="text" id="chatbot-input-text" placeholder="메시지를 입력하세요">
			<button id="chatbot-input-submit">전송</button>
		</div>
		<div id="chatbot-options-container"></div>
		<!-- 선택 창을 담을 컨테이너 -->
	</div>
	<!-- div#wrap -->
	<script src="/script/jquery-3.6.4.min.js"></script>
	<script src="/script/script.js"></script>
</body>
</html>