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
div#lnb {
	margin: 0 50px 0 0;
}
</style>
</head>
<body>
	<div id="wrap">
		<header>
			<!-- 헤더템플릿 시작 -->
			<%@ include file="/WEB-INF/views/ind/headerTmp.jsp"%>
			<!-- 헤더템플릿 끝 -->
		</header>

		<main id="main" class="dFlex">
			<div id="lnb">
				<!-- 메인 LNB 템플릿 시작 -->
				<%@ include file="/WEB-INF/views/ind/mainLnbTmp.jsp"%>
				<!-- 메인 LNB 템플릿 끝 -->
			</div>


			<div id="mainnotice"></div>
		</main>

		<!-- 푸터템플릿 시작 -->
		<%@ include file="/WEB-INF/views/ind/footerTmp.jsp"%>
		<!-- 푸터템플릿 끝 -->
	</div>
	<!-- div#wrap -->
	<script src="/script/jquery-3.6.4.min.js"></script>
	<script src="/script/script.js"></script>
	<script>
		$(document).ready(function() {
			// 공지사항 메뉴 초기 로딩
			loadContent("/notice?gnbParam=notice");
		});

		function loadContent(url) {
			$.ajax({
				url : url,
				type : "GET",
				dataType : "html",
				success : function(data) {
					$("#mainnotice").html(data);
				},
				error : function() {
					console.log("컨텐츠 로딩 중 오류 발생.");
				}
			});
		}

		$("#lnbMainMenu li a").click(function(event) {
			event.preventDefault();
			var url = $(this).data("url");
			loadContent(url);
		});
	</script>
</body>
</html>