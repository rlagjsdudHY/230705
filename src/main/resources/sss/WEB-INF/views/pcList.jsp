<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>Document</title>
		<link rel="stylesheet" href="/style/style.css">
	</head>
	<body>
		<div id="wrap">
			<h1>제품 목록</h1>
			<hr>
			<c:forEach var="list" items="${pcList}">
				<div class="pc" data-link="${list.pcNum}">
					<span>제품명 : ${list.pcNum}</span>
					<span>${list.goodsName}</span><br><br>
					<span>모니터 포함 : ${list.monitor}</span><br><br>
					<span>CPU : ${list.pcCpu}</span><br><br>
					<span>CPU쿨러 : ${list.cpuCooler}</span><br><br>
					<span>메모리 : ${list.pcMemory}</span><br><br>
					<span>메인보드 : ${list.mainboard}</span><br><br>
					<span>SSD하드 : ${list.ssd}</span><br><br>
					<span>HDD추가 : ${list.hdd}</span><br><br>
					<span>그래픽카드 : ${list.graphic}</span><br><br>
					<span>CD드라이브 : ${list.cd}</span><br><br>
					<span>사운드 : ${list.sound}</span><br><br>
					<span>랜카드 : ${list.networkCard}</span><br><br>
					<span>케이스 : ${list.pcCase}</span><br><br>
					<span>파워 : ${list.power}</span><br><br>
					<span>윈도우 : ${list.windows}</span><br><br>
					<span>오피스 : ${list.office}</span><br><br>
					<span>사은품 : ${list.freeGift}</span><br><br>
					<span>AS : ${list.asFix}</span>
				</div>
			</c:forEach>
			
		</div>
		<!-- div#wrap -->
		<script src="/script/jquery-3.6.4.min.js"></script>
		<script src="/script/script.js"></script>
	</body>
</html>