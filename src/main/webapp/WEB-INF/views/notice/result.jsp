<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
request.setCharacterEncoding("UTF-8");
String uidSession = (String) session.getAttribute("uidSession");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" href="/style/style.css">
<link rel="stylesheet" href="/style/style_Template.css">
<style>
div#wrapResult {
	margin: 0 auto;
	width: 1000px;
	text-align: center;
}

table {
	border-collapse: collapse;
	width: 900px;
	margin: 0 auto;
}

table th {
	border: 1px solid #000;
	background-color: #78b9e0;
}

table td {
	border: 1px solid #000;
}
/* 				div#submitLine { margin-top: 30px; float:right; }	 */
table#listHeader tbody tr th:nth-child(1) {
	width: 180px;
}

table#listHeader tbody tr th:nth-child(2) {
	width: 530px;
}

table#listHeader tbody tr th:nth-child(3) {
	width: 220px;
}

table#listHeader tbody tr th:nth-child(4) {
	width: 150px;
}

table#listHeader tbody tr th:nth-child(5) {
	width: 220px;
}

tr.listRow:hover {
	background-color: rgba(0, 128, 255, 0.05);
	cursor: pointer;
}

div#search {
	text-align: center;
}

div#nWrite {
	float: right;
}

input#searchText {
	width: 300px;
	height: 30px;
}

button {
	padding: 10px 15px;
}
</style>
</head>
<body>
	<div id="wrapResult">
		<header>
			<!-- 헤더템플릿 시작 -->
			<%@ include file="/WEB-INF/views/ind/headerTmp.jsp"%>
<!-- 헤더템플릿 끝 -->
</header>
<!-- 메인 LNB 템플릿 시작 -->
<%@ include file="/WEB-INF/views/ind/mainLnbTmp.jsp" %>
<!-- 메인 LNB 템플릿 끝 -->

<c:forEach var="list" items="${noticeList}">
	<h1>글쓰기 상세보기(noticeList)</h1>
	<hr>

	<table id="listHeader">
		<tbody>
			<tr>
				<th>번호</th>
				<th>내용</th>
				<th>글쓴이</th>
				<th>조회</th>
				<th>날짜</th>
			</tr>
		</tbody>
		<tbody id="listInner">
			<tr>
				<td>${list.num }</td>
				<td>${list.content }</td>
				<td>${list.writer }</td>
				<td>${list.readcnt }</td>
				<td><fmt:formatDate value="${list.regTM}" pattern="yyyy-MM-dd" /></td>
			</tr>
		</tbody>
	</table>

</c:forEach>
<button onclick="location.href='/mainnotice?gnbParam=notice'">목록</button>
<%
			if ((uidSession != null && "admin".equals(uidSession))) {
		%>
<button value="${num}" id="noticeDel" form="noticeFrm" name="num">삭제</button>
<%
			} else {
		%>
<span></span>
<%
			}
		%>
<form action="" id="noticeFrm"></form>
<!-- 푸터템플릿 시작 -->
<%@ include file="/WEB-INF/views/ind/footerTmp.jsp"%>
<!-- 푸터템플릿 끝 -->
</div>
<!-- div#wrap -->
<script src="/script/jquery-3.6.4.min.js"></script>
<script src="/script/script.js"></script>
<script>
	$(function() {
		$("#noticeDel").click(function() {
			$("#noticeFrm").attr("action", "/noticeDel");
			$("#noticeFrm").submit();
		});
	});
</script>
</body>
</html>

