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
				<h2>${findIDSucc[0].uname}님 아이디 조회 결과</h2>
				<c:forEach var="list" items="${findIDSucc}">
				<div id="IDList" class="dFlex">
					<span>아이디</span>
					<span>${list.uid}</span>
					<span>가입일</span>
					<fmt:formatDate var="regTM" value="${list.regTM}" pattern="YYYY-MM-dd"/>
					<span>${regTM}</span>
				</div>
				<hr>
				</c:forEach>
				
				<div id="btnArea">
					<button type="button" onclick="location.href='/findPW'">P/W 찾기</button>
					<button type="button" onclick="location.href='/'">홈페이지</button>
					<button type="button" onclick="location.href='/login'">로그인</button>
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
	</body>
</html>